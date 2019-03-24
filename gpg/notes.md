# Install GPG on MacOS and import private key from your other machine
```
brew install gpg2
gpg --import /path/to/pk
```


# Generate a new key
```
gpg --full-generate-key
```


# Export your public key
```
gpg --export --armor manimaul@gmail.com > ./pub.key
```

# Export your private key
```
gpg --export-secret-keys --armor manimaul@gmail.com > ./private.key
```

# Encrypt a file for a recipeint
```
gpg --encrypt /path/to/file/to/encrypt
```


# Setup Git to auto sign commits
```
git config --global commit.gpgsign true
gpg --list-secret-keys --keyid-format LONG manimaul@gmail.com 
git config --global user.signingkey 369716D4576FF50F 
```


# MacOS PIN Entry
```
brew install pinentry-mac
echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
killall gpg-agent
echo "test" | gpg --clearsign
```

