import "NonFungibleToken"
import "ExampleNFT"
import "MetadataViews"

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

        // Issue a capability for the collection
        let cap = signer.capabilities.storage.issue<&ExampleNFT.Collection>(
            ExampleNFT.CollectionStoragePath
        )

        // Publish the capability for public use
        signer.capabilities.publish(cap, at: ExampleNFT.CollectionPublicPath)
    }

    execute {
        log("Setup account")
    }
}
