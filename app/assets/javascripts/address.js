if ( window.SpareCoins === undefined ) {
  window.SpareCoins = function() {};
}

SpareCoins.Address = function( fAddress, fCryptPrivateKey, fPrivateKey ) {
  var self;
  var fPrivateKey;
  var fBalance;

  init();

  // === Data API ===
  self.save = save;

  // === Getters ===
  self.getAddress = getAddress;
  self.getfCryptPrivateKey = getfCryptPrivateKey;
  self.getPrivateKey = getPrivateKey;

  // === API ===
  self.validate = validate;
  self.encrypt = encrypt;
  self.decrypt = decrypt;
  self.toHash160 = toHash160;

  return self;

  // === Address Implementation ===
  function init() {
    self = {};
    fBalance = 0;
    if ( fAddress === undefined && fCryptPrivateKey === undefined ) {
      createNewAddress();
    }
  }

  // === Data API ===
  // returns: boolean
  function save( passwordDigest, storage ) {
    // what should password digest be equal to for it to be true ?
    // be specific
    if ( passwordDigest !== undefined ) {
      encrypt( passwordDigest );
    } else {
      return false;
    }

    // TODO: Validate fCryptPrivateKey
    if ( fCryptPrivateKey !== undefined && validate() ) {
      storage.set( "wallet", fAddress, fCryptPrivateKey );
      return true;
    } else
      return false;
  }

  // === Getters ===
  function getAddress() {
    return fAddress
  }

  function getPrivateKey() {
    return fPrivateKey;
  }

  function getfCryptPrivateKey() {
    return fCryptPrivateKey;
  }

  // === API ===
  function validate() {
    var bytes = toBytes();
    var end = bytes.length - 4;
    var addressChecksum = bytes.slice( end, bytes.length );
    var hash = bytes.slice( 0, end );
    var hashChecksum = doubleShaBytes( hash );
    return assertEqual( addressChecksum, hashChecksum.slice( 0, 4 ) );

    function doubleShaBytes( hash ) {
      var asBytes = {
        asBytes: true
      };
      return Crypto.SHA256( Crypto.SHA256( hash, asBytes ), asBytes );
    }

    // TODO: if (self.privateKey !== "") check private key as well
    function assertEqual( checksum1, checksum2 ) {
      if ( checksum1.length !== checksum2.length || checksum1.length !== 4 ) {
        return false;
      }
      for ( var i = 0; i < checksum1.length; ++i ) {
        if ( checksum1[ i ] !== checksum2[ i ] ) return false;
      }
      return true;
    }
  }

  // returns: bool
  function encrypt( passwordDigest ) {
    // TODO: make sure its UTF8 encoded
    if ( fPrivateKey !== undefined ) {
      var encrypted = CryptoJS.AES.encrypt( fPrivateKey, passwordDigest );
      fCryptPrivateKey = encrypted.toString();
      fPrivateKey = undefined;
    } else {
      throw new Error( "Private Key not found" );
    }
  }

  // returns: bool
  // TODO: Handle cases where decrypt returns false
  function decrypt( passwordDigest ) {
    // TODO: Check for presence
    var encryptedRoot = fCryptPrivateKey;
    var decrypted = CryptoJS.AES.decrypt( encryptedRoot, passwordDigest );

    try {
      fPrivateKey = decrypted.toString( CryptoJS.enc.Utf8 );
    } catch ( err ) {
      return false;
    }

    if ( fPrivateKey === "" ) {
      return false;
    }
    return true;
  }

  function toHash160() {
    var bytes = toBytes();
    var end = bytes.length - 4;
    var hash160 = bytes.slice( 1, end );
    return Crypto.util.bytesToHex( hash160 );
  }
  // === API End ===

  function createPrivateKeyBytes() {
    var privateKeyBytes = [];
    var randArr = new Uint8Array( 32 );
    crypto.getRandomValues( randArr );
    for ( var i = 0; i < randArr.length; i++ ) {
      privateKeyBytes[ i ] = randArr[ i ];
    }
    return privateKeyBytes;
  }

  function createNewAddress() {
    var privateKeyBytes = createPrivateKeyBytes();
    var ecKey = new Bitcoin.ECKey( privateKeyBytes );
    var address = ecKey.getBitcoinAddress().toString();
    var privateKeyWIF = new Bitcoin.Address( privateKeyBytes );
    privateKeyWIF.version = 0x80;
    privateKeyWIF = privateKeyWIF.toString();
    fAddress = address;
    fPrivateKey = privateKeyWIF;
  }

  function toBytes() {
    return Bitcoin.Base58.decode( fAddress );
  }

  function updateBalance( balance ) {
    fBalance = balance;
  }
};
