module FIXTURES; end

# This is fake
FIXTURES::TRANSACTION = {
  "tx_id" => 1107991,
  "tx_hash" => "6f75031be62b24145797316eb1132955dc8ea5645d440b1631132cb69e8ef5b6",
  "tx_version" => 1,
  "tx_locktime" => 0,
  "tx_size" => 224,
  "block_hash" => "000000004745260fdee0626c2fffafa5fa24599a4f063475fba9352e10dfc1fc",
  "block_height" => 180192,
  "block_time" => 1391754096,
  "estimated_time" => 1391752069,
  "confirmations" => 704,
  "vin_sz" => 1,
  "vout_sz" => 1,
  "in" => [
    {
      "prev_out" => {
        "n" => 0,
        "tx_hash" => "eeba5c69296223c3fd36316c6e9a3016c23b04666d3d96f89f4ef417c613062a",
        "tx_id" => 1097546,
        "value" => 100_000,
        "address" => "mzPkw5EdvHCntC2hrhRXSqwHLHpLWzSZiL",
        "hash160" => "cf0dfe6e0fa6ea5dda32c58ff699071b672e1faf"
        },
        "scriptSig" => "483045022100b221efe8d99824385547276657613a661dcfbb906188830913aaa16c3c18876d02200ee9c852a9291a48deb752768553841580e816913f52dfc6a05f966d142f5c09014104e1934263e84e202ebffca95246b63c18c07cd369c4f02de76dbd1db89e6255dacb3ab1895af0422e24e1d1099e80f01b899cfcdf9b947575352dbc1af57466b5",
        "meta" => {
          "tx_id" => 1107991,
          "txin_pos" => 0
        }
      }
  ],
  "out" => [
    {
      "n" => 0,
      "value" => 100_000,
      "scriptPubKey" => "76a914652c453e3f8768d6d6e1f2985cb8939db91a4e0588ac",
      "spent" => false,
      "address" => "mvaRDyLUeF4CP7Lu9umbU3FxehyC5nUz3L",
      "meta" => {
        "tx_id" => 1107991
      }
    }
  ],
  "total_inputs_value" => 110_000,
  "total_outputs_value" => 100_000,
  "fees" => 10000,
  "raw_hex" => "01000000012a0613c617f44e9ff8963d6d66043bc216309a6e6c3136fdc3236229695cbaee000000008b483045022100b221efe8d99824385547276657613a661dcfbb906188830913aaa16c3c18876d02200ee9c852a9291a48deb752768553841580e816913f52dfc6a05f966d142f5c09014104e1934263e84e202ebffca95246b63c18c07cd369c4f02de76dbd1db89e6255dacb3ab1895af0422e24e1d1099e80f01b899cfcdf9b947575352dbc1af57466b5ffffffff0110270000000000001976a914652c453e3f8768d6d6e1f2985cb8939db91a4e0588ac00000000",
  "estimated_tx_direction" => "incoming",
  "estimated_tx_value" => 100_000
}

# This is fake
FIXTURES::TRANSACTION_NO_FEES = {
  "tx_id" => 1107991,
  "tx_hash" => "6f75031be62b24145797316eb1132955dc8ea5645d440b1631132cb69e8ef5b6",
  "tx_version" => 1,
  "tx_locktime" => 0,
  "tx_size" => 224,
  "block_hash" => "000000004745260fdee0626c2fffafa5fa24599a4f063475fba9352e10dfc1fc",
  "block_height" => 180192,
  "block_time" => 1391754096,
  "estimated_time" => 1391752069,
  "confirmations" => 704,
  "vin_sz" => 1,
  "vout_sz" => 1,
  "in" => [
    {
      "prev_out" => {
        "n" => 0,
        "tx_hash" => "eeba5c69296223c3fd36316c6e9a3016c23b04666d3d96f89f4ef417c613062a",
        "tx_id" => 1097546,
        "value" => 10000,
        "address" => "mzPkw5EdvHCntC2hrhRXSqwHLHpLWzSZiL",
        "hash160" => "cf0dfe6e0fa6ea5dda32c58ff699071b672e1faf"
        },
        "scriptSig" => "483045022100b221efe8d99824385547276657613a661dcfbb906188830913aaa16c3c18876d02200ee9c852a9291a48deb752768553841580e816913f52dfc6a05f966d142f5c09014104e1934263e84e202ebffca95246b63c18c07cd369c4f02de76dbd1db89e6255dacb3ab1895af0422e24e1d1099e80f01b899cfcdf9b947575352dbc1af57466b5",
        "meta" => {
          "tx_id" => 1107991,
          "txin_pos" => 0
        }
      }
  ],
  "out" => [
    {
      "n" => 0,
      "value" => 10000,
      "scriptPubKey" => "76a914652c453e3f8768d6d6e1f2985cb8939db91a4e0588ac",
      "spent" => false,
      "address" => "mvaRDyLUeF4CP7Lu9umbU3FxehyC5nUz3L",
      "meta" => {
        "tx_id" => 1107991
      }
    }
  ],
  "total_inputs_value" => 10000,
  "total_outputs_value" => 10000,
  "fees" => 0,
  "raw_hex" => "01000000012a0613c617f44e9ff8963d6d66043bc216309a6e6c3136fdc3236229695cbaee000000008b483045022100b221efe8d99824385547276657613a661dcfbb906188830913aaa16c3c18876d02200ee9c852a9291a48deb752768553841580e816913f52dfc6a05f966d142f5c09014104e1934263e84e202ebffca95246b63c18c07cd369c4f02de76dbd1db89e6255dacb3ab1895af0422e24e1d1099e80f01b899cfcdf9b947575352dbc1af57466b5ffffffff0110270000000000001976a914652c453e3f8768d6d6e1f2985cb8939db91a4e0588ac00000000",
  "estimated_tx_direction" => "incoming",
  "estimated_tx_value" => 10000
}

FIXTURES::TRANSACTION_BELOW_MIN = {
  "tx_id" => 1107991,
  "tx_hash" => "6f75031be62b24145797316eb1132955dc8ea5645d440b1631132cb69e8ef5b6",
  "tx_version" => 1,
  "tx_locktime" => 0,
  "tx_size" => 224,
  "block_hash" => "000000004745260fdee0626c2fffafa5fa24599a4f063475fba9352e10dfc1fc",
  "block_height" => 180192,
  "block_time" => 1391754096,
  "estimated_time" => 1391752069,
  "confirmations" => 704,
  "vin_sz" => 1,
  "vout_sz" => 1,
  "in" => [
    {
      "prev_out" => {
        "n" => 0,
        "tx_hash" => "eeba5c69296223c3fd36316c6e9a3016c23b04666d3d96f89f4ef417c613062a",
        "tx_id" => 1097546,
        "value" => 100_000,
        "address" => "mzPkw5EdvHCntC2hrhRXSqwHLHpLWzSZiL",
        "hash160" => "cf0dfe6e0fa6ea5dda32c58ff699071b672e1faf"
        },
        "scriptSig" => "483045022100b221efe8d99824385547276657613a661dcfbb906188830913aaa16c3c18876d02200ee9c852a9291a48deb752768553841580e816913f52dfc6a05f966d142f5c09014104e1934263e84e202ebffca95246b63c18c07cd369c4f02de76dbd1db89e6255dacb3ab1895af0422e24e1d1099e80f01b899cfcdf9b947575352dbc1af57466b5",
        "meta" => {
          "tx_id" => 1107991,
          "txin_pos" => 0
        }
      }
  ],
  "out" => [
    {
      "n" => 0,
      "value" => 49_000,
      "scriptPubKey" => "76a914652c453e3f8768d6d6e1f2985cb8939db91a4e0588ac",
      "spent" => false,
      "address" => "mvaRDyLUeF4CP7Lu9umbU3FxehyC5nUz3L",
      "meta" => {
        "tx_id" => 1107991
      }
    }
  ],
  "total_inputs_value" => 100_000,
  "total_outputs_value" => 49_000,
  "fees" => 10000,
  "raw_hex" => "01000000012a0613c617f44e9ff8963d6d66043bc216309a6e6c3136fdc3236229695cbaee000000008b483045022100b221efe8d99824385547276657613a661dcfbb906188830913aaa16c3c18876d02200ee9c852a9291a48deb752768553841580e816913f52dfc6a05f966d142f5c09014104e1934263e84e202ebffca95246b63c18c07cd369c4f02de76dbd1db89e6255dacb3ab1895af0422e24e1d1099e80f01b899cfcdf9b947575352dbc1af57466b5ffffffff0110270000000000001976a914652c453e3f8768d6d6e1f2985cb8939db91a4e0588ac00000000",
  "estimated_tx_direction" => "incoming",
  "estimated_tx_value" => 49_000
}

FIXTURES::TRANSACTION_LOW_OUTPUTS = {
  "tx_id" => 1107991,
  "tx_hash" => "6f75031be62b24145797316eb1132955dc8ea5645d440b1631132cb69e8ef5b6",
  "tx_version" => 1,
  "tx_locktime" => 0,
  "tx_size" => 224,
  "block_hash" => "000000004745260fdee0626c2fffafa5fa24599a4f063475fba9352e10dfc1fc",
  "block_height" => 180192,
  "block_time" => 1391754096,
  "estimated_time" => 1391752069,
  "confirmations" => 704,
  "vin_sz" => 1,
  "vout_sz" => 1,
  "in" => [
    {
      "prev_out" => {
        "n" => 0,
        "tx_hash" => "eeba5c69296223c3fd36316c6e9a3016c23b04666d3d96f89f4ef417c613062a",
        "tx_id" => 1097546,
        "value" => 20000,
        "address" => "mzPkw5EdvHCntC2hrhRXSqwHLHpLWzSZiL",
        "hash160" => "cf0dfe6e0fa6ea5dda32c58ff699071b672e1faf"
        },
        "scriptSig" => "483045022100b221efe8d99824385547276657613a661dcfbb906188830913aaa16c3c18876d02200ee9c852a9291a48deb752768553841580e816913f52dfc6a05f966d142f5c09014104e1934263e84e202ebffca95246b63c18c07cd369c4f02de76dbd1db89e6255dacb3ab1895af0422e24e1d1099e80f01b899cfcdf9b947575352dbc1af57466b5",
        "meta" => {
          "tx_id" => 1107991,
          "txin_pos" => 0
        }
      }
  ],
  "out" => [
    {
      "n" => 0,
      "value" => 5399,
      "scriptPubKey" => "76a914652c453e3f8768d6d6e1f2985cb8939db91a4e0588ac",
      "spent" => false,
      "address" => "mvaRDyLUeF4CP7Lu9umbU3FxehyC5nUz3L",
      "meta" => {
        "tx_id" => 1107991
      }
    }
  ],
  "total_inputs_value" => 20000,
  "total_outputs_value" => 5399,
  "fees" => 10000,
  "raw_hex" => "01000000012a0613c617f44e9ff8963d6d66043bc216309a6e6c3136fdc3236229695cbaee000000008b483045022100b221efe8d99824385547276657613a661dcfbb906188830913aaa16c3c18876d02200ee9c852a9291a48deb752768553841580e816913f52dfc6a05f966d142f5c09014104e1934263e84e202ebffca95246b63c18c07cd369c4f02de76dbd1db89e6255dacb3ab1895af0422e24e1d1099e80f01b899cfcdf9b947575352dbc1af57466b5ffffffff0110270000000000001976a914652c453e3f8768d6d6e1f2985cb8939db91a4e0588ac00000000",
  "estimated_tx_direction" => "incoming",
  "estimated_tx_value" => 10000
}
