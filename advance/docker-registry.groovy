import org.sonatype.nexus.blobstore.api.BlobStoreManager; 
import org.sonatype.nexus.repository.storage.WritePolicy; 

// Change default password
def user = security.securitySystem.getUser('admin')
user.setEmailAddress('admin@admin.com')
security.securitySystem.updateUser(user)
security.securitySystem.changePassword('admin','admin123')
log.info('default password for admin changed')

// Create Docker registry
repository.createDockerHosted('docker-registry', 8082, null, BlobStoreManager.DEFAULT_BLOBSTORE_NAME, true, true, WritePolicy.ALLOW)