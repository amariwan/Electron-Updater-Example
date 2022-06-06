$rootCert = New-SelfSignedCertificate -DnsName "aland" -Type CodeSigningCert -CertStoreLocation "D:\projekte\ShoppingList\electron-auto-update\certs\" 
$rootcertPassword = ConvertTo-SecureString -String "Aland" -Force -AsPlainText
$rootCertPath = Join-Path -Path 'cert:\CurrentUser\My\' -ChildPath "$($rootcert.Thumbprint)"
$rootCertPath = Join-Path -Path 'cert:\LocalMachine\My\' -ChildPath "$($rootcert.Thumbprint)"
Export-PfxCertificate -Cert $rootCertPath -FilePath 'RootCA.pfx' -Password $rootcertPassword
Export-Certificate -Cert $rootCertPath -FilePath 'RootCA.crt'