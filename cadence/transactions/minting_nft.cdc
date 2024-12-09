import "NonFungibleToken"
import "ExampleNFT"
import "MetadataViews"

// This transaction is what an account would run
// to set itself up to receive NFTs

transaction {

    prepare(signer: auth(Storage, Capabilities) &Account) {
        // Return early if the account already has a collection
        if signer.storage.borrow<&ExampleNFT.Collection>(from: ExampleNFT.CollectionStoragePath) != nil {
            return
        }

        // Create a new empty collection
        let collection <- ExampleNFT.createEmptyCollection()

        // Save it to the account
        signer.storage.save(<-collection, to: ExampleNFT.CollectionStoragePath)

        // Create a public capability for the collection
        let cap = signer.capabilities.storage.issue<&{NonFungibleToken.CollectionPublic, MetadataViews.ResolverCollection}>(
            from: ExampleNFT.CollectionStoragePath
        )
        signer.capabilities.publish(cap, at: ExampleNFT.CollectionPublicPath)
    }

    execute {
        log("Setup account")
    }
}
