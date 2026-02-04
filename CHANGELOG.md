# Changelog

## [2.1.0](https://github.com/taikoxyz/simple-taiko-node/compare/v2.0.0...v2.1.0) (2026-02-04)


### Features

* add echo informing of the proposer being disabled before 'sleep infinity' ([#139](https://github.com/taikoxyz/simple-taiko-node/issues/139)) ([541c04b](https://github.com/taikoxyz/simple-taiko-node/commit/541c04b8348e2ad39b87dba3546aeebd9d604529))
* add update-env.sh util script ([#106](https://github.com/taikoxyz/simple-taiko-node/issues/106)) ([0a15475](https://github.com/taikoxyz/simple-taiko-node/commit/0a15475e43c6d68bf053cce1f0ed277cd9149ea8))
* **all:** add default `proposeBlockTxGasTipCap` flag value for proposers ([#110](https://github.com/taikoxyz/simple-taiko-node/issues/110)) ([6b084e2](https://github.com/taikoxyz/simple-taiko-node/commit/6b084e26be97b9c3566d94ed0eceaf33e88103e4))
* **all:** initial commit ([#1](https://github.com/taikoxyz/simple-taiko-node/issues/1)) ([c44176c](https://github.com/taikoxyz/simple-taiko-node/commit/c44176c6c5c017ceb5d945d3a8d348ee2b67d30a))
* **all:** update configurations for alpha-5 testnet ([#121](https://github.com/taikoxyz/simple-taiko-node/issues/121)) ([3f5347e](https://github.com/taikoxyz/simple-taiko-node/commit/3f5347e9a308ee37a3c7861d02b5705e7c4b66a7))
* **alpha-3:** add more bootnodes ([#58](https://github.com/taikoxyz/simple-taiko-node/issues/58)) ([76de101](https://github.com/taikoxyz/simple-taiko-node/commit/76de101a175c9185421da22579f90dabb9ea1f38))
* **alpha-4:** add Eldfell network configs ([#67](https://github.com/taikoxyz/simple-taiko-node/issues/67)) ([d34b96b](https://github.com/taikoxyz/simple-taiko-node/commit/d34b96b062d19a0562398202aca2b597e81f6a5b))
* **alpha-6:** add `Katla` network configs ([#158](https://github.com/taikoxyz/simple-taiko-node/issues/158)) ([bf1d2a2](https://github.com/taikoxyz/simple-taiko-node/commit/bf1d2a2b59bcdb6f702d3cb56ac6781ed134ea88))
* apply assignmenthook update for hekla  ([#301](https://github.com/taikoxyz/simple-taiko-node/issues/301)) ([db01c11](https://github.com/taikoxyz/simple-taiko-node/commit/db01c113d8952c888d8031afc50d8d9bf2969493))
* **chore:** update docker-compose configurations ([#53](https://github.com/taikoxyz/simple-taiko-node/issues/53)) ([3ee89e7](https://github.com/taikoxyz/simple-taiko-node/commit/3ee89e7bd47dfc0c640298641e434f253169eec9))
* docker-compose.yml formatting ([#225](https://github.com/taikoxyz/simple-taiko-node/issues/225)) ([0ca3155](https://github.com/taikoxyz/simple-taiko-node/commit/0ca3155fc29840857204e6c0a32e73eb6eafb78f))
* **docker:** bump `taiko-geth` tag ([#433](https://github.com/taikoxyz/simple-taiko-node/issues/433)) ([93d186e](https://github.com/taikoxyz/simple-taiko-node/commit/93d186ed78bfa1cb315e392f04006aff4ecd23dd))
* **docker:** bump Hekla tags ([#376](https://github.com/taikoxyz/simple-taiko-node/issues/376)) ([62fd167](https://github.com/taikoxyz/simple-taiko-node/commit/62fd167afd462a2175d8d614d9ff3d9367d33528))
* **docker:** bump Hekla tags for `sgx_geth` ([#381](https://github.com/taikoxyz/simple-taiko-node/issues/381)) ([4ec6ccf](https://github.com/taikoxyz/simple-taiko-node/commit/4ec6ccfdf6fb276a08ae415ce6b7326a3adeb4ed))
* **docker:** update flags/script for preconfs ([#389](https://github.com/taikoxyz/simple-taiko-node/issues/389)) ([61886f2](https://github.com/taikoxyz/simple-taiko-node/commit/61886f2ed94fd2d69c0a6d3aa8e99c37aa0b500c))
* **docker:** update mainnet tags for Pectra fork ([#383](https://github.com/taikoxyz/simple-taiko-node/issues/383)) ([6821768](https://github.com/taikoxyz/simple-taiko-node/commit/6821768e2ee958b905bb567854edea6b174721f3))
* **docker:** updates for Mainnet `Pacaya` fork ([#385](https://github.com/taikoxyz/simple-taiko-node/issues/385)) ([171cec3](https://github.com/taikoxyz/simple-taiko-node/commit/171cec3afacbb3a923e5e1be8e684d7d9b0fe5d5))
* **driver,prover,proposer:** bump  client version ([#353](https://github.com/taikoxyz/simple-taiko-node/issues/353)) ([02fa9b6](https://github.com/taikoxyz/simple-taiko-node/commit/02fa9b6aafde655a5db56b656e7d60a9a85bdd88))
* **driver,prover:** update mainnet bootnodes and scripts ([#403](https://github.com/taikoxyz/simple-taiko-node/issues/403)) ([3b7869a](https://github.com/taikoxyz/simple-taiko-node/commit/3b7869a8452435322c7fd27a3eac470a9c371a0c))
* **driver:** add blobserver flag back, update env comments ([#427](https://github.com/taikoxyz/simple-taiko-node/issues/427)) ([18a3fc8](https://github.com/taikoxyz/simple-taiko-node/commit/18a3fc879230a10c0cdf8e353b621f6e5c4f7354))
* **driver:** add docker compose about tolba testnet ([#417](https://github.com/taikoxyz/simple-taiko-node/issues/417)) ([0bb27e1](https://github.com/taikoxyz/simple-taiko-node/commit/0bb27e13b3bd20d728831fd2a6bb5fc34a78bfce))
* **driver:** blobserver flag  ([#424](https://github.com/taikoxyz/simple-taiko-node/issues/424)) ([efda3fc](https://github.com/taikoxyz/simple-taiko-node/commit/efda3fcebe8172964da38cb2b8f9d42e32943f34))
* **driver:** reset taiko hoodi with chain id 167013 ([#420](https://github.com/taikoxyz/simple-taiko-node/issues/420)) ([d80c9ab](https://github.com/taikoxyz/simple-taiko-node/commit/d80c9ab846994c5627792d12a106208f3c11f161))
* **eldfell:** add `PROVE_UNASSIGNED_BLOCKS` env ([#69](https://github.com/taikoxyz/simple-taiko-node/issues/69)) ([1d6e1cd](https://github.com/taikoxyz/simple-taiko-node/commit/1d6e1cd5be8fe55568ff349cf0ca3ef16440f835))
* **eldfell:** increase zkevm-chain-rpcd wait timeout ([#73](https://github.com/taikoxyz/simple-taiko-node/issues/73)) ([d9e6586](https://github.com/taikoxyz/simple-taiko-node/commit/d9e6586bbb941095e60ac6e506622d9a7139df2a))
* **eldfell:** update `PORT_L3_EXECTION_ENGINE_HTTP` && `PORT_L3_EXECTION_ENGINE_WS` ([#68](https://github.com/taikoxyz/simple-taiko-node/issues/68)) ([3a75489](https://github.com/taikoxyz/simple-taiko-node/commit/3a75489a28b3c3cde17462f0bd4fdef04a680c01))
* **eldfell:** update default bootnodes ([#98](https://github.com/taikoxyz/simple-taiko-node/issues/98)) ([2b8d662](https://github.com/taikoxyz/simple-taiko-node/commit/2b8d6620dc2e8ae146cc9812ca02fc9bfe96ad24))
* **eldfell:** update service names ([#70](https://github.com/taikoxyz/simple-taiko-node/issues/70)) ([e7cb642](https://github.com/taikoxyz/simple-taiko-node/commit/e7cb6425bbf7d1c5972888c33f1bd70d573c1c96))
* **env:** add TxMgr flag annotations ([#334](https://github.com/taikoxyz/simple-taiko-node/issues/334)) ([dd9322f](https://github.com/taikoxyz/simple-taiko-node/commit/dd9322f10f4d1fa7bc4e46daed9a5accb0581486))
* **env:** update Hekla && mainnet bootnodes ([#332](https://github.com/taikoxyz/simple-taiko-node/issues/332)) ([0955f43](https://github.com/taikoxyz/simple-taiko-node/commit/0955f43191fa62175d89a911b6d3085424b15d85))
* **env:** use golden touch account as `L2_THROWAWAY_BLOCK_BUILDER` ([#12](https://github.com/taikoxyz/simple-taiko-node/issues/12)) ([fc4de37](https://github.com/taikoxyz/simple-taiko-node/commit/fc4de37d2b16a9c3b2c2c963bf4809395cc7482f))
* **geth:** increase base fee ([#408](https://github.com/taikoxyz/simple-taiko-node/issues/408)) ([f46d733](https://github.com/taikoxyz/simple-taiko-node/commit/f46d7331ca409fad9e95583e8003ebb3dbc934ec))
* **grimsvotn:** add `DISABLE_P2P_SYNC` option ([#57](https://github.com/taikoxyz/simple-taiko-node/issues/57)) ([55cc163](https://github.com/taikoxyz/simple-taiko-node/commit/55cc16384591b5b84f14f0ce3ea55a7a36125ebe))
* **grimsvotn:** update A3 zkevm-chain-prover-rpcd memory limit ([#95](https://github.com/taikoxyz/simple-taiko-node/issues/95)) ([836d217](https://github.com/taikoxyz/simple-taiko-node/commit/836d217185be902d769cff2f7a2b0ca536d75e44))
* **grímsvötn:** update p2p sync timeout config ([#56](https://github.com/taikoxyz/simple-taiko-node/issues/56)) ([c1b5cd0](https://github.com/taikoxyz/simple-taiko-node/commit/c1b5cd02bff6f8502b0a842ab2b89f72babfcbec))
* handle unix signals ([#224](https://github.com/taikoxyz/simple-taiko-node/issues/224)) ([247ef63](https://github.com/taikoxyz/simple-taiko-node/commit/247ef6382e17f9f1aa381440348dc4d13e3c2558))
* **hekla:** bump client and l2ee version ([#326](https://github.com/taikoxyz/simple-taiko-node/issues/326)) ([2f6c06e](https://github.com/taikoxyz/simple-taiko-node/commit/2f6c06e0384f9bc7127795146d0d026558a4020e))
* **hekla:** bump client tags ([#373](https://github.com/taikoxyz/simple-taiko-node/issues/373)) ([451dab3](https://github.com/taikoxyz/simple-taiko-node/commit/451dab300b85f942bd58dc1aaf6fc290cd287332))
* **hekla:** bump Hekla client tag ([#337](https://github.com/taikoxyz/simple-taiko-node/issues/337)) ([b575679](https://github.com/taikoxyz/simple-taiko-node/commit/b575679af1262f72426ada160596b586cf3cff99))
* **hekla:** introduce `--gpo.ignoreprice` flag ([#247](https://github.com/taikoxyz/simple-taiko-node/issues/247)) ([e5221f2](https://github.com/taikoxyz/simple-taiko-node/commit/e5221f24a418cb6fa49b95a41c15edcedefa0779))
* **hekla:** modify `simple-taiko-node` for hekla  ([#205](https://github.com/taikoxyz/simple-taiko-node/issues/205)) ([b0a1b21](https://github.com/taikoxyz/simple-taiko-node/commit/b0a1b211a8d1e6610ea3ad8c31594faba4adc37d))
* **hekla:** update default `TX_GAS_LIMIT` config ([#209](https://github.com/taikoxyz/simple-taiko-node/issues/209)) ([e75f5f0](https://github.com/taikoxyz/simple-taiko-node/commit/e75f5f05027c59e17d0b31122119ede035f6f2b6))
* **hekla:** update tags for Hekla ([#371](https://github.com/taikoxyz/simple-taiko-node/issues/371)) ([f2a4af7](https://github.com/taikoxyz/simple-taiko-node/commit/f2a4af77a4b960ed1046aad1d53aed23717a8043))
* **hoodi:** add blob server URL for driver ([#422](https://github.com/taikoxyz/simple-taiko-node/issues/422)) ([aa77f21](https://github.com/taikoxyz/simple-taiko-node/commit/aa77f21ad5e23ceecf2a7c0d4172a2255cb0f592))
* **hoodi:** introduce Shasta fork on hoodi ([#434](https://github.com/taikoxyz/simple-taiko-node/issues/434)) ([4882679](https://github.com/taikoxyz/simple-taiko-node/commit/4882679586a0eaf63db8a14c3d228df1d3fd5758))
* **jolnir:** update default gas limit configurations ([#129](https://github.com/taikoxyz/simple-taiko-node/issues/129)) ([96c48a5](https://github.com/taikoxyz/simple-taiko-node/commit/96c48a5b2c3a5b8f42e5a29305482de46644305b))
* **katla:** improve `start-zkevm-chain-rpcd.sh` ([#164](https://github.com/taikoxyz/simple-taiko-node/issues/164)) ([e56a6e7](https://github.com/taikoxyz/simple-taiko-node/commit/e56a6e754774f703817ea5213968c4c6f576bcd0))
* **log:** add `PROVER IS DISABLED` log ([#178](https://github.com/taikoxyz/simple-taiko-node/issues/178)) ([25af49c](https://github.com/taikoxyz/simple-taiko-node/commit/25af49c14687cc8345394f690f5c94ce8aa4c6ae))
* **mainnet:** bump client version ([#304](https://github.com/taikoxyz/simple-taiko-node/issues/304)) ([67bcff0](https://github.com/taikoxyz/simple-taiko-node/commit/67bcff0fb5abb3a00ac6abea07b2d18e8874c618))
* **mainnet:** bump client version ([#336](https://github.com/taikoxyz/simple-taiko-node/issues/336)) ([9166881](https://github.com/taikoxyz/simple-taiko-node/commit/9166881fb0e9bb6025910f861143cc0720eba76e))
* **mainnet:** bump version ([#341](https://github.com/taikoxyz/simple-taiko-node/issues/341)) ([ec5868f](https://github.com/taikoxyz/simple-taiko-node/commit/ec5868f1f2ad6585193148b48f5ae2a32cdc9055))
* **mainnet:** update mainnet configs ([#276](https://github.com/taikoxyz/simple-taiko-node/issues/276)) ([ebe5bd7](https://github.com/taikoxyz/simple-taiko-node/commit/ebe5bd726915c3ff17c0f9c8b7f6c5f70e826515))
* **node:** set locals in node ([#92](https://github.com/taikoxyz/simple-taiko-node/issues/92)) ([08a5b0d](https://github.com/taikoxyz/simple-taiko-node/commit/08a5b0d132bd16646dc8c10ee575ed0978f45a4c))
* **proposer:** proposer can only propose local transactions ([#91](https://github.com/taikoxyz/simple-taiko-node/issues/91)) ([8ba42aa](https://github.com/taikoxyz/simple-taiko-node/commit/8ba42aa089d356ea61f882f9dfc2a0091bde2476))
* **proposer:** Proposer gas limit + script refactor ([#101](https://github.com/taikoxyz/simple-taiko-node/issues/101)) ([17f1d0c](https://github.com/taikoxyz/simple-taiko-node/commit/17f1d0c495e146b8668c77e6c225605f586da4c3))
* **proposer:** remove unused `BLOCK_BUILDER_TIP` ([#309](https://github.com/taikoxyz/simple-taiko-node/issues/309)) ([f11e6be](https://github.com/taikoxyz/simple-taiko-node/commit/f11e6be27c8da1662154a0b06430a86f11ab6f1f))
* **proposer:** rm tier fee ([#310](https://github.com/taikoxyz/simple-taiko-node/issues/310)) ([aaf2ce0](https://github.com/taikoxyz/simple-taiko-node/commit/aaf2ce0665f3de8d69947d44ef8c7fa1521ee9b0))
* **proposer:** support epoch.minTip ([#316](https://github.com/taikoxyz/simple-taiko-node/issues/316)) ([e8c1f9a](https://github.com/taikoxyz/simple-taiko-node/commit/e8c1f9a836865336149839b31e4f4529d13290c9))
* **proposer:** update proposer RPC config temporarily ([#26](https://github.com/taikoxyz/simple-taiko-node/issues/26)) ([23eb266](https://github.com/taikoxyz/simple-taiko-node/commit/23eb266addf42fdd9e80ca2c7d66e400fc38c5dd))
* **proposer:** wait receipt timeout flags + refactor prover scripts ([#104](https://github.com/taikoxyz/simple-taiko-node/issues/104)) ([e76acb9](https://github.com/taikoxyz/simple-taiko-node/commit/e76acb94f888863d825b2c3f6c5be1c393552cac))
* **prover,proposer,driver:** bump  client version ([#330](https://github.com/taikoxyz/simple-taiko-node/issues/330)) ([ce53ce2](https://github.com/taikoxyz/simple-taiko-node/commit/ce53ce22a63069adf5c84c01769117127b7e5403))
* **prover,proposer,driver:** bump l2ee and driver versions ([#329](https://github.com/taikoxyz/simple-taiko-node/issues/329)) ([6cfd9f1](https://github.com/taikoxyz/simple-taiko-node/commit/6cfd9f11197500b304038e8acd10ac4008e9379f))
* **prover:** add proof skip size config for L3 ([#118](https://github.com/taikoxyz/simple-taiko-node/issues/118)) ([569592a](https://github.com/taikoxyz/simple-taiko-node/commit/569592a0c3d404a3fbfba99668b2cddd3b379429))
* **prover:** add prove block tx gas limit flag  ([#115](https://github.com/taikoxyz/simple-taiko-node/issues/115)) ([42d62bc](https://github.com/taikoxyz/simple-taiko-node/commit/42d62bc24b074b5c3ccdc79b227963d4fbaee1d3))
* **prover:** remove unnecesary env in hekla .env.sample and fix ([#325](https://github.com/taikoxyz/simple-taiko-node/issues/325)) ([0db06a8](https://github.com/taikoxyz/simple-taiko-node/commit/0db06a8835bd7ca720865c709ee0e711c3350cb2))
* **prover:** support running node and sgx prover on different servers ([#221](https://github.com/taikoxyz/simple-taiko-node/issues/221)) ([e84507a](https://github.com/taikoxyz/simple-taiko-node/commit/e84507acf1a280b2838f66b00e1948eba88c0f0e))
* **prover:** update version of prover in hekla ([#323](https://github.com/taikoxyz/simple-taiko-node/issues/323)) ([8ecd3bc](https://github.com/taikoxyz/simple-taiko-node/commit/8ecd3bc7f9f9591fe448e044f7a48ca85a45d28c))
* remove unused configs ([#305](https://github.com/taikoxyz/simple-taiko-node/issues/305)) ([073bf24](https://github.com/taikoxyz/simple-taiko-node/commit/073bf24be6557fcc80968b3ff24bd94de17f91c7))
* **repo:** add editorconfig ([#320](https://github.com/taikoxyz/simple-taiko-node/issues/320)) ([bc5a9d0](https://github.com/taikoxyz/simple-taiko-node/commit/bc5a9d00d6aad03d2abc21de084fdf442781edab))
* **repo:** bump client version ([#360](https://github.com/taikoxyz/simple-taiko-node/issues/360)) ([317b66f](https://github.com/taikoxyz/simple-taiko-node/commit/317b66facb1dbbcf544842e10434e50f1cab0d13))
* **repo:** enable OpenAI-based review ([#52](https://github.com/taikoxyz/simple-taiko-node/issues/52)) ([6d0d863](https://github.com/taikoxyz/simple-taiko-node/commit/6d0d863b1341ee158da946ffa2c78d08afcc65c6))
* **repo:** update Hekla image tags for Pacaya fork ([#369](https://github.com/taikoxyz/simple-taiko-node/issues/369)) ([0f1e3b1](https://github.com/taikoxyz/simple-taiko-node/commit/0f1e3b1bee713735e9f44469913fa6645f09de82))
* **repo:** update Hekla image tags for Pacaya fork ([#374](https://github.com/taikoxyz/simple-taiko-node/issues/374)) ([d1182fb](https://github.com/taikoxyz/simple-taiko-node/commit/d1182fbe148150350b5cef8cea59f0fc9e27ebcc))
* rm useless config ([#281](https://github.com/taikoxyz/simple-taiko-node/issues/281)) ([eebfffa](https://github.com/taikoxyz/simple-taiko-node/commit/eebfffa82ff7c1a5eeddbd549cc7371914ed323a))
* **script:** add condition to check requirement variables for proposer/prover ([#238](https://github.com/taikoxyz/simple-taiko-node/issues/238)) ([fca0c9a](https://github.com/taikoxyz/simple-taiko-node/commit/fca0c9ae061085f4d11b1abf9452b71f9ed58cbd))
* set default home dashboard ([#174](https://github.com/taikoxyz/simple-taiko-node/issues/174)) ([63a9aa7](https://github.com/taikoxyz/simple-taiko-node/commit/63a9aa7010b81da18e2a68dda767bf66e2020f05))
* start multiple `zkevm-chain` provers ([#94](https://github.com/taikoxyz/simple-taiko-node/issues/94)) ([2d12441](https://github.com/taikoxyz/simple-taiko-node/commit/2d12441c0743192701443c86bd337f463d609376))
* update default ports ([#89](https://github.com/taikoxyz/simple-taiko-node/issues/89)) ([27b902e](https://github.com/taikoxyz/simple-taiko-node/commit/27b902eee8dab2d1c3dea3a6fbb32b1907f6ab5f))
* update sync timeout ([#59](https://github.com/taikoxyz/simple-taiko-node/issues/59)) ([cfbc2a0](https://github.com/taikoxyz/simple-taiko-node/commit/cfbc2a02b95304382c424dd2c752646799647bc8))
* update tags for Hekla / mainnet ([#340](https://github.com/taikoxyz/simple-taiko-node/issues/340)) ([3884f86](https://github.com/taikoxyz/simple-taiko-node/commit/3884f860aa33d94a4c24450388e8634f96d243af))


### Bug Fixes

* add backwards compat for new env var and small typo ([#96](https://github.com/taikoxyz/simple-taiko-node/issues/96)) ([f7610ad](https://github.com/taikoxyz/simple-taiko-node/commit/f7610ad4902c2d23df45deab8678fe8d66d1b71e))
* add default value for `GETH_ADDITIONAL_ARGS` ([#267](https://github.com/taikoxyz/simple-taiko-node/issues/267)) ([aec2678](https://github.com/taikoxyz/simple-taiko-node/commit/aec2678258dcd6d1272e6bbd9f023129f06931c9))
* **docker-compose:** make hard-coded prover's port dynamic ([#41](https://github.com/taikoxyz/simple-taiko-node/issues/41)) ([8c08689](https://github.com/taikoxyz/simple-taiko-node/commit/8c0868924adbb558fb2d6f2178923d95428b51d3))
* **docker:** hotfix image for mainnet ([#387](https://github.com/taikoxyz/simple-taiko-node/issues/387)) ([8358fae](https://github.com/taikoxyz/simple-taiko-node/commit/8358fae4cc417e6d6294e4bf84e4be228d967d7b))
* **docs:** correct IP format in `.env.sample` endpoints ([#170](https://github.com/taikoxyz/simple-taiko-node/issues/170)) ([3bf68cd](https://github.com/taikoxyz/simple-taiko-node/commit/3bf68cda84997082fb3ecdcc48d0aa668e4f9996))
* double quotation ([#312](https://github.com/taikoxyz/simple-taiko-node/issues/312)) ([8d5be17](https://github.com/taikoxyz/simple-taiko-node/commit/8d5be172de0b49f75cf15b7e36a2c6f3ae7f9536))
* **driver, prover:** remove prover_set req, move flags ([#411](https://github.com/taikoxyz/simple-taiko-node/issues/411)) ([9745c68](https://github.com/taikoxyz/simple-taiko-node/commit/9745c68461cf1945adc455f8368e2cc33f1bee48))
* **driver:** fix image tag ([#362](https://github.com/taikoxyz/simple-taiko-node/issues/362)) ([8671583](https://github.com/taikoxyz/simple-taiko-node/commit/86715839fcb38e7338165b5f43298b842861239d))
* **eldfell:** fix `--proveUnassignedBlocks` flag setting ([#109](https://github.com/taikoxyz/simple-taiko-node/issues/109)) ([0a86e18](https://github.com/taikoxyz/simple-taiko-node/commit/0a86e18dfa0a038f8d36c8793870326e8fd4e96e))
* **eldfell:** fix zkevm-chain-proverd port in prover relayer script ([#72](https://github.com/taikoxyz/simple-taiko-node/issues/72)) ([dee982e](https://github.com/taikoxyz/simple-taiko-node/commit/dee982e27ee8a14dac09bb6b084fef804a8cd9d4))
* **eldfell:** make zkevm-rpcd-chain port number explicit ([#71](https://github.com/taikoxyz/simple-taiko-node/issues/71)) ([38d2114](https://github.com/taikoxyz/simple-taiko-node/commit/38d2114ca1e68a70e574f129c7fa3e02677d3904))
* **eldfell:** update zkevm-chain-rpcd host ([#75](https://github.com/taikoxyz/simple-taiko-node/issues/75)) ([5a63f47](https://github.com/taikoxyz/simple-taiko-node/commit/5a63f47ca5fce97fc32cfc05fbbb4ac8d3e39beb))
* **eldfell:** Use correct env flag in start-prover-relayer.sh ([#79](https://github.com/taikoxyz/simple-taiko-node/issues/79)) ([9c1cdba](https://github.com/taikoxyz/simple-taiko-node/commit/9c1cdba5d730ae3cc5ba50656d797e3db18d28b1))
* **eldfell:** Use env variable for port assignment in start-zkevm-chain-rpcd.sh ([#77](https://github.com/taikoxyz/simple-taiko-node/issues/77)) ([a1dfb6d](https://github.com/taikoxyz/simple-taiko-node/commit/a1dfb6d26fa35e43a9e81dca1f720d67224272a0))
* **env:** fix sample env file formatting ([7c15a6d](https://github.com/taikoxyz/simple-taiko-node/commit/7c15a6d790abd09471cc4aeb23bcc1144525b93e))
* **env:** Update for .env.sample.l3 ([#99](https://github.com/taikoxyz/simple-taiko-node/issues/99)) ([4b6ab2a](https://github.com/taikoxyz/simple-taiko-node/commit/4b6ab2af4020bbde30b0c863706e1c6e82c97b2d))
* **env:** update sample env files ([#90](https://github.com/taikoxyz/simple-taiko-node/issues/90)) ([a62598d](https://github.com/taikoxyz/simple-taiko-node/commit/a62598d7fb026fbf0fc9d07ba408ff98cde8942c))
* **grafana:** set `'Instant'` as default query type for instant metrics ([#251](https://github.com/taikoxyz/simple-taiko-node/issues/251)) ([9201f1a](https://github.com/taikoxyz/simple-taiko-node/commit/9201f1aabf73b6ee97cb093d3517cb634df43ee6))
* **grimsvotn:** fix `start-prover-relayer.sh` script ([#108](https://github.com/taikoxyz/simple-taiko-node/issues/108)) ([f83afaa](https://github.com/taikoxyz/simple-taiko-node/commit/f83afaa6936981e94cda328336db5a92641157f7))
* **hekla:** bump Hekla Pacaya tags ([#378](https://github.com/taikoxyz/simple-taiko-node/issues/378)) ([52a4ba2](https://github.com/taikoxyz/simple-taiko-node/commit/52a4ba2fdacb660feb8877b03e151739f57ba04a))
* l3 grafana dashboard ([#88](https://github.com/taikoxyz/simple-taiko-node/issues/88)) ([8f4e9ba](https://github.com/taikoxyz/simple-taiko-node/commit/8f4e9bab90de80bdc886c2e32ef4b13ccc6d8333))
* **node:** Typo fix spelling EXECUTION .env and yml files ([#119](https://github.com/taikoxyz/simple-taiko-node/issues/119)) ([d5f46aa](https://github.com/taikoxyz/simple-taiko-node/commit/d5f46aab36f90d352b48929eeb91d19270525da3))
* **proposer,driver,prover:** bump version ([#343](https://github.com/taikoxyz/simple-taiko-node/issues/343)) ([254fb8e](https://github.com/taikoxyz/simple-taiko-node/commit/254fb8ef10bec85ec467dada37dc3b8b9968a003))
* **proposer:** check enabled before args ([#255](https://github.com/taikoxyz/simple-taiko-node/issues/255)) ([d54b0dd](https://github.com/taikoxyz/simple-taiko-node/commit/d54b0dd0205a2709b0505cf5cc791889a2cdbe7e))
* **proposer:** fix proposer var ([#256](https://github.com/taikoxyz/simple-taiko-node/issues/256)) ([d9afb56](https://github.com/taikoxyz/simple-taiko-node/commit/d9afb56f9beb7b8dc26d7f13c4d8795bede8f771))
* **prover,proposer:** script fixes ([#358](https://github.com/taikoxyz/simple-taiko-node/issues/358)) ([6d06a90](https://github.com/taikoxyz/simple-taiko-node/commit/6d06a9096e0ecdb4b169c18b3c690a7b71615bea))
* **prover:** remove deprecated flag ([#366](https://github.com/taikoxyz/simple-taiko-node/issues/366)) ([ce0354f](https://github.com/taikoxyz/simple-taiko-node/commit/ce0354f7b22b06d8cc30589f2887ddd7b66db3e0))
* **prover:** reorder script args ([#204](https://github.com/taikoxyz/simple-taiko-node/issues/204)) ([df19538](https://github.com/taikoxyz/simple-taiko-node/commit/df19538417978c8f822fe1b71b46cbbd8a041ecf))
* **repo:** fix link in readme ([#364](https://github.com/taikoxyz/simple-taiko-node/issues/364)) ([f6871ae](https://github.com/taikoxyz/simple-taiko-node/commit/f6871aeebd518999949dd74e848efa526fa24f45))
* **repo:** fix openAI review workflow ([#54](https://github.com/taikoxyz/simple-taiko-node/issues/54)) ([d8896cf](https://github.com/taikoxyz/simple-taiko-node/commit/d8896cf2c0e94fb1c0da36a1cb9b2df658f5c17e))
* **script:** use docker internal port ([#45](https://github.com/taikoxyz/simple-taiko-node/issues/45)) ([1ef326a](https://github.com/taikoxyz/simple-taiko-node/commit/1ef326a8afbdceee159f051b6c35d3277750cab0))
* update docker-compose.yml for better p2p configuration ([#258](https://github.com/taikoxyz/simple-taiko-node/issues/258)) ([bce9544](https://github.com/taikoxyz/simple-taiko-node/commit/bce95442c8e2840ece0daca4138eea26e8e50e22))


### Chores

* add comments for proposeBlock gas params ([#113](https://github.com/taikoxyz/simple-taiko-node/issues/113)) ([89ff0df](https://github.com/taikoxyz/simple-taiko-node/commit/89ff0dfc2e9167857a783fadb52e58e1139847cd))
* add warnings to env sample ([#87](https://github.com/taikoxyz/simple-taiko-node/issues/87)) ([d9125d9](https://github.com/taikoxyz/simple-taiko-node/commit/d9125d9118de55277746c7d3c8c382415cf45bbd))
* bump `taiko-client` tag ([#286](https://github.com/taikoxyz/simple-taiko-node/issues/286)) ([d9a1df2](https://github.com/taikoxyz/simple-taiko-node/commit/d9a1df2a51c33f47b3382bd9786ee6fdc4909021))
* bump taiko-client tag ([#283](https://github.com/taikoxyz/simple-taiko-node/issues/283)) ([34b68b8](https://github.com/taikoxyz/simple-taiko-node/commit/34b68b8d70e2c29ee6586823dfa1daf61c714f85))
* bump taiko-client tag ([#293](https://github.com/taikoxyz/simple-taiko-node/issues/293)) ([5d703ee](https://github.com/taikoxyz/simple-taiko-node/commit/5d703ee2db4dff5ad0c88fd216ad6ed3855f4bd6))
* **ci:** introduce `Close Inactive Issues` workflow ([#249](https://github.com/taikoxyz/simple-taiko-node/issues/249)) ([02c27e9](https://github.com/taikoxyz/simple-taiko-node/commit/02c27e9d5ac85838ca0948c9cc28a458a16154ab))
* **config:** update default configurations ([#9](https://github.com/taikoxyz/simple-taiko-node/issues/9)) ([f19df61](https://github.com/taikoxyz/simple-taiko-node/commit/f19df616b23d904580a3852d2fea7f7235a607c8))
* **docker-compose:** remove obsolete `docker-compose.yml` version ([#211](https://github.com/taikoxyz/simple-taiko-node/issues/211)) ([1f3652f](https://github.com/taikoxyz/simple-taiko-node/commit/1f3652fde00e5dd70733a984a56e11eee8d13030))
* **docker:** bump client hotfix version ([#397](https://github.com/taikoxyz/simple-taiko-node/issues/397)) ([b420668](https://github.com/taikoxyz/simple-taiko-node/commit/b420668d0226e70db9a7822e79d891a44256916a))
* **docker:** bump Hekla tags ([#338](https://github.com/taikoxyz/simple-taiko-node/issues/338)) ([6abe049](https://github.com/taikoxyz/simple-taiko-node/commit/6abe0490faae82aa6783df41ad668d42f0fc74a2))
* **docker:** remove hekla proposer profile ([#392](https://github.com/taikoxyz/simple-taiko-node/issues/392)) ([07a1da9](https://github.com/taikoxyz/simple-taiko-node/commit/07a1da9143955e4b633e1bae31104da19fe3c9db))
* **docker:** update geth image ([#321](https://github.com/taikoxyz/simple-taiko-node/issues/321)) ([246dbb3](https://github.com/taikoxyz/simple-taiko-node/commit/246dbb3fd93e35a76d19eb985a6225b2448ce1a1))
* **docker:** update Hekla `taiko-client` tags ([#367](https://github.com/taikoxyz/simple-taiko-node/issues/367)) ([a4ac24f](https://github.com/taikoxyz/simple-taiko-node/commit/a4ac24ffb273e0458203c54e14859684a688c996))
* **docker:** update images and remove leftover proposer profile ([#394](https://github.com/taikoxyz/simple-taiko-node/issues/394)) ([fc89a0d](https://github.com/taikoxyz/simple-taiko-node/commit/fc89a0dad18f4916dbb30c8b2ada00e56e2c1814))
* **docs:** fix typo in env var ([#15](https://github.com/taikoxyz/simple-taiko-node/issues/15)) ([244a380](https://github.com/taikoxyz/simple-taiko-node/commit/244a380449af963b8f52a72c5155b50fb56180af))
* **docs:** update README ([#3](https://github.com/taikoxyz/simple-taiko-node/issues/3)) ([c5ec981](https://github.com/taikoxyz/simple-taiko-node/commit/c5ec981658d631ba7c2c120af9a38a76d24cb2b4))
* **docs:** Update README.md ([8484e77](https://github.com/taikoxyz/simple-taiko-node/commit/8484e7702ab2bca93ec09d910c230128d8c22b80))
* **driver, prover, :** update versions ([#399](https://github.com/taikoxyz/simple-taiko-node/issues/399)) ([d0a79df](https://github.com/taikoxyz/simple-taiko-node/commit/d0a79df92c6adab6c60e0888b970473f786f0a8a))
* **driver:** bump mainnet driver version ([#428](https://github.com/taikoxyz/simple-taiko-node/issues/428)) ([a16fbcf](https://github.com/taikoxyz/simple-taiko-node/commit/a16fbcf158e75af549d75ba474457d9d83f9cf81))
* **driver:** hotfix ([#409](https://github.com/taikoxyz/simple-taiko-node/issues/409)) ([1ee99e2](https://github.com/taikoxyz/simple-taiko-node/commit/1ee99e262cf3baeea0e50448f1027a1d73ba2b7e))
* **driver:** hotfix geth flag ([#413](https://github.com/taikoxyz/simple-taiko-node/issues/413)) ([e740be2](https://github.com/taikoxyz/simple-taiko-node/commit/e740be2d06633b459c3597e346c79ca445eb09d8))
* **driver:** hotfix version ([#406](https://github.com/taikoxyz/simple-taiko-node/issues/406)) ([e3a4859](https://github.com/taikoxyz/simple-taiko-node/commit/e3a485965ac76fdb81b1f03593cf5dca49f6fd8d))
* **driver:** update hekla p2p bootnodes ([#401](https://github.com/taikoxyz/simple-taiko-node/issues/401)) ([4ecf454](https://github.com/taikoxyz/simple-taiko-node/commit/4ecf454d844e03740035c88253127b7d42f6b36b))
* **env:** add disclaimer for revert protection ([#356](https://github.com/taikoxyz/simple-taiko-node/issues/356)) ([5da07b3](https://github.com/taikoxyz/simple-taiko-node/commit/5da07b387b72c4ec62a0157187fa2339b842c97d))
* **env:** remove default value for `TX_GAS_LIMIT` ([#239](https://github.com/taikoxyz/simple-taiko-node/issues/239)) ([31a38ad](https://github.com/taikoxyz/simple-taiko-node/commit/31a38adb945c8c77c132b162f24fb0e042850846))
* **env:** update `.env.sample.hekla` ([4bd0a2a](https://github.com/taikoxyz/simple-taiko-node/commit/4bd0a2a4cc1ff818fdbf75a8e4614cfdf77c5632))
* **env:** update `.env` `TKO` -&gt; `TTKOj`  ([#128](https://github.com/taikoxyz/simple-taiko-node/issues/128)) ([493b881](https://github.com/taikoxyz/simple-taiko-node/commit/493b881431b778fdcd82ec5db0eb661ccb233615))
* **hekla,driver,client:** add flag to enable p2p network ([#405](https://github.com/taikoxyz/simple-taiko-node/issues/405)) ([34bc59b](https://github.com/taikoxyz/simple-taiko-node/commit/34bc59b4fcdef55da163475a51e11da538eda931))
* **hekla:** bump client & taiko-geth image version ([#327](https://github.com/taikoxyz/simple-taiko-node/issues/327)) ([09d77eb](https://github.com/taikoxyz/simple-taiko-node/commit/09d77ebc61506cf6fb67fd60b7ffba4325ee8c6f))
* **hekla:** bump client & taiko-geth image version ([#328](https://github.com/taikoxyz/simple-taiko-node/issues/328)) ([807926f](https://github.com/taikoxyz/simple-taiko-node/commit/807926fb9f0c27a9dbc756d345ceb65a81fcfdf0))
* **hoodi:** bump geth version ([#425](https://github.com/taikoxyz/simple-taiko-node/issues/425)) ([b0335cd](https://github.com/taikoxyz/simple-taiko-node/commit/b0335cd5196bfe8ae9212f5b82b4aa80fe359e9b))
* **image:** use `snaefellsjokull` tags ([#13](https://github.com/taikoxyz/simple-taiko-node/issues/13)) ([99a4174](https://github.com/taikoxyz/simple-taiko-node/commit/99a41741624a7021fb2adf2d10eb1a09f7c9dc48))
* **l2ee:** upgrade geth version ([#359](https://github.com/taikoxyz/simple-taiko-node/issues/359)) ([7fd1b29](https://github.com/taikoxyz/simple-taiko-node/commit/7fd1b2913730828e827347b9bbd6fd90abd7d2b0))
* **mainnet:** add p2p bootnodes provided by nethermind on mainnet ([#430](https://github.com/taikoxyz/simple-taiko-node/issues/430)) ([ca170b5](https://github.com/taikoxyz/simple-taiko-node/commit/ca170b58f989584daeb255d7269c007f531f0170))
* **mainnet:** update a comment ([#288](https://github.com/taikoxyz/simple-taiko-node/issues/288)) ([81c587f](https://github.com/taikoxyz/simple-taiko-node/commit/81c587fbde246bcd2a04a243049efc52fb95c2cb))
* **main:** release 1.0.0 ([#266](https://github.com/taikoxyz/simple-taiko-node/issues/266)) ([05a475b](https://github.com/taikoxyz/simple-taiko-node/commit/05a475b09b653c29c86516840f8cea46783edfd0))
* **main:** release 1.10.0 ([#361](https://github.com/taikoxyz/simple-taiko-node/issues/361)) ([74bf368](https://github.com/taikoxyz/simple-taiko-node/commit/74bf36866e5e820235fc00b0faa05a692fe8164c))
* **main:** release 1.10.1 ([#363](https://github.com/taikoxyz/simple-taiko-node/issues/363)) ([d2b7e9d](https://github.com/taikoxyz/simple-taiko-node/commit/d2b7e9dc74b1767cd4889ef3c7d1c3153b4630ab))
* **main:** release 1.10.2 ([#365](https://github.com/taikoxyz/simple-taiko-node/issues/365)) ([da6b840](https://github.com/taikoxyz/simple-taiko-node/commit/da6b8407d01dbf2f2174eb9d63d676ac90274891))
* **main:** release 1.10.3 ([#368](https://github.com/taikoxyz/simple-taiko-node/issues/368)) ([118e4d4](https://github.com/taikoxyz/simple-taiko-node/commit/118e4d46164dc8de7952a23e7f748de2b6b24f0d))
* **main:** release 1.11.0 ([#370](https://github.com/taikoxyz/simple-taiko-node/issues/370)) ([2788112](https://github.com/taikoxyz/simple-taiko-node/commit/2788112bb7a1c4d0e8e938bf1807cd39f90f6b4c))
* **main:** release 1.12.0 ([#375](https://github.com/taikoxyz/simple-taiko-node/issues/375)) ([11ddbac](https://github.com/taikoxyz/simple-taiko-node/commit/11ddbacf97915b4b9efb65e08f7e8eac5f4ebd5b))
* **main:** release 1.13.0 ([#377](https://github.com/taikoxyz/simple-taiko-node/issues/377)) ([529211a](https://github.com/taikoxyz/simple-taiko-node/commit/529211aa21278e52dbdfa588d0ce75f57e0aca98))
* **main:** release 1.13.1 ([#379](https://github.com/taikoxyz/simple-taiko-node/issues/379)) ([5e5cb67](https://github.com/taikoxyz/simple-taiko-node/commit/5e5cb677afc629c4c4da8ccd326249743ba9ffe0))
* **main:** release 1.14.0 ([#382](https://github.com/taikoxyz/simple-taiko-node/issues/382)) ([e0a1222](https://github.com/taikoxyz/simple-taiko-node/commit/e0a1222cf204fd508e91c23ba41841f23b2d5e9c))
* **main:** release 1.15.0 ([#384](https://github.com/taikoxyz/simple-taiko-node/issues/384)) ([2fa21d1](https://github.com/taikoxyz/simple-taiko-node/commit/2fa21d1c0cfe1c49416d6f7fc7f086c459c86cc4))
* **main:** release 1.16.0 ([#386](https://github.com/taikoxyz/simple-taiko-node/issues/386)) ([c0b075c](https://github.com/taikoxyz/simple-taiko-node/commit/c0b075cb0b64cf50425e4896ddc26673a96d849e))
* **main:** release 1.16.1 ([#388](https://github.com/taikoxyz/simple-taiko-node/issues/388)) ([3e488ff](https://github.com/taikoxyz/simple-taiko-node/commit/3e488ff80e33a2eb29be32703c1f73a49cecf6a8))
* **main:** release 1.17.0 ([#391](https://github.com/taikoxyz/simple-taiko-node/issues/391)) ([54ba9e3](https://github.com/taikoxyz/simple-taiko-node/commit/54ba9e377cf4ae7895ee029b37e2bfc366b028bf))
* **main:** release 1.17.1 ([#393](https://github.com/taikoxyz/simple-taiko-node/issues/393)) ([1c061c7](https://github.com/taikoxyz/simple-taiko-node/commit/1c061c73c3be46357ccc5cc189dd93c8f0a8231f))
* **main:** release 1.17.2 ([#395](https://github.com/taikoxyz/simple-taiko-node/issues/395)) ([d6a4248](https://github.com/taikoxyz/simple-taiko-node/commit/d6a4248e19dfb23bf758005f83d5612e3e3cbe6a))
* **main:** release 1.17.3 ([#398](https://github.com/taikoxyz/simple-taiko-node/issues/398)) ([79a7a84](https://github.com/taikoxyz/simple-taiko-node/commit/79a7a849b90a6341b25e769557eb1db97903d393))
* **main:** release 1.17.4 ([#400](https://github.com/taikoxyz/simple-taiko-node/issues/400)) ([7e54f94](https://github.com/taikoxyz/simple-taiko-node/commit/7e54f94db690f5b1a1101cc8b093bea8d305ad04))
* **main:** release 1.18.0 ([#404](https://github.com/taikoxyz/simple-taiko-node/issues/404)) ([4bd24ef](https://github.com/taikoxyz/simple-taiko-node/commit/4bd24ef65cf2b97a13f8b0751e9ae0f0e38a1665))
* **main:** release 1.18.1 ([#407](https://github.com/taikoxyz/simple-taiko-node/issues/407)) ([54a9faf](https://github.com/taikoxyz/simple-taiko-node/commit/54a9faf8ff37277cff0fdf31aa88e40fec8a0ee5))
* **main:** release 1.18.2 ([#410](https://github.com/taikoxyz/simple-taiko-node/issues/410)) ([d48b841](https://github.com/taikoxyz/simple-taiko-node/commit/d48b8411b7fe3bd32163f03f1a1a841ff1efc010))
* **main:** release 1.19.0 ([#412](https://github.com/taikoxyz/simple-taiko-node/issues/412)) ([252647f](https://github.com/taikoxyz/simple-taiko-node/commit/252647fb51fc9dfaad0f105b16a0344faa9dc5bc))
* **main:** release 1.2.0 ([#302](https://github.com/taikoxyz/simple-taiko-node/issues/302)) ([1d0048c](https://github.com/taikoxyz/simple-taiko-node/commit/1d0048ccb3666a3204e58d70ee12c21ebc4c7ea5))
* **main:** release 1.20.0 ([#414](https://github.com/taikoxyz/simple-taiko-node/issues/414)) ([7ab0acf](https://github.com/taikoxyz/simple-taiko-node/commit/7ab0acfa3bc0755a07d7bc0c45e3a07f6d77f7a1))
* **main:** release 1.20.1 ([#419](https://github.com/taikoxyz/simple-taiko-node/issues/419)) ([67bf561](https://github.com/taikoxyz/simple-taiko-node/commit/67bf56146bf6a536f5fbc831a22527ea0a2c6d6b))
* **main:** release 1.21.0 ([#421](https://github.com/taikoxyz/simple-taiko-node/issues/421)) ([87d7a9e](https://github.com/taikoxyz/simple-taiko-node/commit/87d7a9ebab31da4bdc6d03922f2cf2cbfec851d4))
* **main:** release 1.22.0 ([#423](https://github.com/taikoxyz/simple-taiko-node/issues/423)) ([dfac8fe](https://github.com/taikoxyz/simple-taiko-node/commit/dfac8fec964129444f6ad9ff45578a6df3ae2558))
* **main:** release 1.23.0 ([#431](https://github.com/taikoxyz/simple-taiko-node/issues/431)) ([4add47a](https://github.com/taikoxyz/simple-taiko-node/commit/4add47a7600b80637ceac8144206031772aa3a39))
* **main:** release 1.3.0 ([#306](https://github.com/taikoxyz/simple-taiko-node/issues/306)) ([3399581](https://github.com/taikoxyz/simple-taiko-node/commit/3399581b49ec00c661b148f4d3ab7d7f207c1799))
* **main:** release 1.4.0 ([#313](https://github.com/taikoxyz/simple-taiko-node/issues/313)) ([e7d458c](https://github.com/taikoxyz/simple-taiko-node/commit/e7d458c8cb0e4ae458f3f15f2a8121804f688034))
* **main:** release 1.5.0 ([#324](https://github.com/taikoxyz/simple-taiko-node/issues/324)) ([c1b48a3](https://github.com/taikoxyz/simple-taiko-node/commit/c1b48a3ebdca4e39ec26d17d908903ac0cca5af1))
* **main:** release 1.6.0 ([#331](https://github.com/taikoxyz/simple-taiko-node/issues/331)) ([346e7ed](https://github.com/taikoxyz/simple-taiko-node/commit/346e7edfe994d39c3eeaa97c9c1b1ff3c292f9cb))
* **main:** release 1.7.0 ([#333](https://github.com/taikoxyz/simple-taiko-node/issues/333)) ([c7b6373](https://github.com/taikoxyz/simple-taiko-node/commit/c7b63736af62b51aaa44160e3fc07ba0d5355fa3))
* **main:** release 1.8.0 ([#335](https://github.com/taikoxyz/simple-taiko-node/issues/335)) ([2416c35](https://github.com/taikoxyz/simple-taiko-node/commit/2416c3582188bd7ccfc12a32733e36c54b2391ea))
* **main:** release 1.8.1 ([#344](https://github.com/taikoxyz/simple-taiko-node/issues/344)) ([a643db8](https://github.com/taikoxyz/simple-taiko-node/commit/a643db85e84051f100ac69dd63f2e05041ea9032))
* **main:** release 1.8.2 ([#350](https://github.com/taikoxyz/simple-taiko-node/issues/350)) ([8a609a4](https://github.com/taikoxyz/simple-taiko-node/commit/8a609a43b96c2e86450b73f370d0c75b9dad8d9a))
* **main:** release 1.9.0 ([#354](https://github.com/taikoxyz/simple-taiko-node/issues/354)) ([515b330](https://github.com/taikoxyz/simple-taiko-node/commit/515b3300dd13363845e13bde3ee1afa837040612))
* **main:** release 1.9.1 ([#357](https://github.com/taikoxyz/simple-taiko-node/issues/357)) ([a353127](https://github.com/taikoxyz/simple-taiko-node/commit/a3531274f47cebc8c70045dda0d6cac3fe160a31))
* **main:** Updating both .env.sample explaining how to use REST port. ([#303](https://github.com/taikoxyz/simple-taiko-node/issues/303)) ([87474c5](https://github.com/taikoxyz/simple-taiko-node/commit/87474c5debe99ab93b54fc953dfb0c6ebf4eaa25))
* **proposer:** fix env var name ([#372](https://github.com/taikoxyz/simple-taiko-node/issues/372)) ([cea04e4](https://github.com/taikoxyz/simple-taiko-node/commit/cea04e4a336b3da7f6edf5dd341e442a5a0a05ca))
* **prover,proposer,driver:** upgrade client version to `0.43.0` on Hekla ([#351](https://github.com/taikoxyz/simple-taiko-node/issues/351)) ([ff47aaf](https://github.com/taikoxyz/simple-taiko-node/commit/ff47aafee80e06d674e3bcb977bdfd5f45bd1e7d))
* **repo:** rename tolba ([#418](https://github.com/taikoxyz/simple-taiko-node/issues/418)) ([69d35e7](https://github.com/taikoxyz/simple-taiko-node/commit/69d35e73b515634b9781d221c94e9112a772bfac))
* update .env.sample ([#117](https://github.com/taikoxyz/simple-taiko-node/issues/117)) ([8d02234](https://github.com/taikoxyz/simple-taiko-node/commit/8d02234468a9cbad23d4554948e4b92b40d8c363))
* update .env.sample default value ([#64](https://github.com/taikoxyz/simple-taiko-node/issues/64)) ([87fe5e5](https://github.com/taikoxyz/simple-taiko-node/commit/87fe5e5c551d1573de4c3416ec61c6f3d525d813))
* update `zkevm-chain-prover-rpcd` volumes ([#39](https://github.com/taikoxyz/simple-taiko-node/issues/39)) ([9bb2423](https://github.com/taikoxyz/simple-taiko-node/commit/9bb24238b6d2e03a2e79918454ac32075f56e32b))
* update env sample comments ([#126](https://github.com/taikoxyz/simple-taiko-node/issues/126)) ([b51ec97](https://github.com/taikoxyz/simple-taiko-node/commit/b51ec973ead21cbd8da0b53db40d2f9070cda405))


### Documentation

* **askja:** update documents for Askja testnet ([#36](https://github.com/taikoxyz/simple-taiko-node/issues/36)) ([837dab1](https://github.com/taikoxyz/simple-taiko-node/commit/837dab13c8fa24286bf5ec3a85856278a5ea9d98))
* **eldfell:** update comments on `.env.sample.l3` ([#78](https://github.com/taikoxyz/simple-taiko-node/issues/78)) ([f89aee4](https://github.com/taikoxyz/simple-taiko-node/commit/f89aee4243c985103bf94344dc81d416e78cbf98))
* **env:** request to Update Comments for Clarity in Token Configuration ([#235](https://github.com/taikoxyz/simple-taiko-node/issues/235)) ([f6aa035](https://github.com/taikoxyz/simple-taiko-node/commit/f6aa035de3406c1140b906ef5ac9ba115b9e8228))
* **hekla:** update comment of `L1_BEACON_HTTP` ([#213](https://github.com/taikoxyz/simple-taiko-node/issues/213)) ([3f6ea92](https://github.com/taikoxyz/simple-taiko-node/commit/3f6ea924be68c7ade52dd68de67b588a01d49a44))
* **node:** change symbol ([#282](https://github.com/taikoxyz/simple-taiko-node/issues/282)) ([e71c262](https://github.com/taikoxyz/simple-taiko-node/commit/e71c2621c2c03830e6f15c63f3d152577540a112))
* **readme:** add faq section about errors ([#27](https://github.com/taikoxyz/simple-taiko-node/issues/27)) ([13255b9](https://github.com/taikoxyz/simple-taiko-node/commit/13255b9660afeecb4d6edf396b0252b98f8596c4))
* **readme:** add needed prerequisites ([#29](https://github.com/taikoxyz/simple-taiko-node/issues/29)) ([d87b34b](https://github.com/taikoxyz/simple-taiko-node/commit/d87b34b58446749ffb0507f6ddfdec8e9888c3b5))
* **readme:** add some FAQs ([#20](https://github.com/taikoxyz/simple-taiko-node/issues/20)) ([98c8d89](https://github.com/taikoxyz/simple-taiko-node/commit/98c8d89ca65c2e3e5195173bc517353aa9207efd))
* **readme:** Add steps description for Proposing ([#22](https://github.com/taikoxyz/simple-taiko-node/issues/22)) ([69e8090](https://github.com/taikoxyz/simple-taiko-node/commit/69e8090088bb4ff4bb04d26343158f7f59c63437))
* **readme:** fix the geth minimum requirements link ([#23](https://github.com/taikoxyz/simple-taiko-node/issues/23)) ([99b8d29](https://github.com/taikoxyz/simple-taiko-node/commit/99b8d297e052211e8c19a35efbef1758379d68d0))
* **repo:** update copyright year in `LICENSE` file ([#432](https://github.com/taikoxyz/simple-taiko-node/issues/432)) ([3ce5478](https://github.com/taikoxyz/simple-taiko-node/commit/3ce54787ce4f840d19f20a0b01cb483bdc4b492b))
* update .env.sample file for mainnet ([#291](https://github.com/taikoxyz/simple-taiko-node/issues/291)) ([92592ff](https://github.com/taikoxyz/simple-taiko-node/commit/92592ff09a6a2f31c3b89e5bcd2042116a1386ab))
* update comments on .env.sample ([#38](https://github.com/taikoxyz/simple-taiko-node/issues/38)) ([1e8dc7d](https://github.com/taikoxyz/simple-taiko-node/commit/1e8dc7d271153a948bd59ab8fedba6cbfcae879d))
* update readme with deprecation announcement ([#33](https://github.com/taikoxyz/simple-taiko-node/issues/33)) ([381cee8](https://github.com/taikoxyz/simple-taiko-node/commit/381cee8419777d892d617589fcb044f233529852))
* Update README.md ([#10](https://github.com/taikoxyz/simple-taiko-node/issues/10)) ([f4560b8](https://github.com/taikoxyz/simple-taiko-node/commit/f4560b88a9549f0783aa515367ac7999d8b72144))
* update to 2023 and rename LICENSE to LICENSE.md ([4049294](https://github.com/taikoxyz/simple-taiko-node/commit/404929445574c5cdd02d89ca7a36ec31a8555aed))


### Workflow

* add release-please ([#265](https://github.com/taikoxyz/simple-taiko-node/issues/265)) ([a0e4422](https://github.com/taikoxyz/simple-taiko-node/commit/a0e4422ea8aa40a5d6594ea7994ede553df56519))
* **repo:** improving repo workflows/renaming ([#317](https://github.com/taikoxyz/simple-taiko-node/issues/317)) ([589456b](https://github.com/taikoxyz/simple-taiko-node/commit/589456b372378558804ed1ddd68ec0a9ab0c085d))

## [1.23.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.22.0...v1.23.0) (2026-01-14)


### Features

* **docker:** bump `taiko-geth` tag ([#433](https://github.com/taikoxyz/simple-taiko-node/issues/433)) ([93d186e](https://github.com/taikoxyz/simple-taiko-node/commit/93d186ed78bfa1cb315e392f04006aff4ecd23dd))


### Chores

* **mainnet:** add p2p bootnodes provided by nethermind on mainnet ([#430](https://github.com/taikoxyz/simple-taiko-node/issues/430)) ([ca170b5](https://github.com/taikoxyz/simple-taiko-node/commit/ca170b58f989584daeb255d7269c007f531f0170))


### Documentation

* **repo:** update copyright year in `LICENSE` file ([#432](https://github.com/taikoxyz/simple-taiko-node/issues/432)) ([3ce5478](https://github.com/taikoxyz/simple-taiko-node/commit/3ce54787ce4f840d19f20a0b01cb483bdc4b492b))

## [1.22.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.21.0...v1.22.0) (2025-12-01)


### Features

* **driver:** add blobserver flag back, update env comments ([#427](https://github.com/taikoxyz/simple-taiko-node/issues/427)) ([18a3fc8](https://github.com/taikoxyz/simple-taiko-node/commit/18a3fc879230a10c0cdf8e353b621f6e5c4f7354))
* **driver:** blobserver flag  ([#424](https://github.com/taikoxyz/simple-taiko-node/issues/424)) ([efda3fc](https://github.com/taikoxyz/simple-taiko-node/commit/efda3fcebe8172964da38cb2b8f9d42e32943f34))
* **hoodi:** add blob server URL for driver ([#422](https://github.com/taikoxyz/simple-taiko-node/issues/422)) ([aa77f21](https://github.com/taikoxyz/simple-taiko-node/commit/aa77f21ad5e23ceecf2a7c0d4172a2255cb0f592))


### Chores

* **driver:** bump mainnet driver version ([#428](https://github.com/taikoxyz/simple-taiko-node/issues/428)) ([a16fbcf](https://github.com/taikoxyz/simple-taiko-node/commit/a16fbcf158e75af549d75ba474457d9d83f9cf81))
* **hoodi:** bump geth version ([#425](https://github.com/taikoxyz/simple-taiko-node/issues/425)) ([b0335cd](https://github.com/taikoxyz/simple-taiko-node/commit/b0335cd5196bfe8ae9212f5b82b4aa80fe359e9b))

## [1.21.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.20.1...v1.21.0) (2025-10-21)


### Features

* **driver:** reset taiko hoodi with chain id 167013 ([#420](https://github.com/taikoxyz/simple-taiko-node/issues/420)) ([d80c9ab](https://github.com/taikoxyz/simple-taiko-node/commit/d80c9ab846994c5627792d12a106208f3c11f161))

## [1.20.1](https://github.com/taikoxyz/simple-taiko-node/compare/v1.20.0...v1.20.1) (2025-09-23)


### Chores

* **repo:** rename tolba ([#418](https://github.com/taikoxyz/simple-taiko-node/issues/418)) ([69d35e7](https://github.com/taikoxyz/simple-taiko-node/commit/69d35e73b515634b9781d221c94e9112a772bfac))

## [1.20.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.19.0...v1.20.0) (2025-09-22)


### Features

* **driver:** add docker compose about tolba testnet ([#417](https://github.com/taikoxyz/simple-taiko-node/issues/417)) ([0bb27e1](https://github.com/taikoxyz/simple-taiko-node/commit/0bb27e13b3bd20d728831fd2a6bb5fc34a78bfce))


### Chores

* **driver:** hotfix geth flag ([#413](https://github.com/taikoxyz/simple-taiko-node/issues/413)) ([e740be2](https://github.com/taikoxyz/simple-taiko-node/commit/e740be2d06633b459c3597e346c79ca445eb09d8))

## [1.19.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.18.2...v1.19.0) (2025-08-12)


### Features

* **geth:** increase base fee ([#408](https://github.com/taikoxyz/simple-taiko-node/issues/408)) ([f46d733](https://github.com/taikoxyz/simple-taiko-node/commit/f46d7331ca409fad9e95583e8003ebb3dbc934ec))

## [1.18.2](https://github.com/taikoxyz/simple-taiko-node/compare/v1.18.1...v1.18.2) (2025-08-12)


### Bug Fixes

* **driver, prover:** remove prover_set req, move flags ([#411](https://github.com/taikoxyz/simple-taiko-node/issues/411)) ([9745c68](https://github.com/taikoxyz/simple-taiko-node/commit/9745c68461cf1945adc455f8368e2cc33f1bee48))


### Chores

* **driver:** hotfix ([#409](https://github.com/taikoxyz/simple-taiko-node/issues/409)) ([1ee99e2](https://github.com/taikoxyz/simple-taiko-node/commit/1ee99e262cf3baeea0e50448f1027a1d73ba2b7e))

## [1.18.1](https://github.com/taikoxyz/simple-taiko-node/compare/v1.18.0...v1.18.1) (2025-08-05)


### Chores

* **driver:** hotfix version ([#406](https://github.com/taikoxyz/simple-taiko-node/issues/406)) ([e3a4859](https://github.com/taikoxyz/simple-taiko-node/commit/e3a485965ac76fdb81b1f03593cf5dca49f6fd8d))

## [1.18.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.17.4...v1.18.0) (2025-07-31)


### Features

* **driver,prover:** update mainnet bootnodes and scripts ([#403](https://github.com/taikoxyz/simple-taiko-node/issues/403)) ([3b7869a](https://github.com/taikoxyz/simple-taiko-node/commit/3b7869a8452435322c7fd27a3eac470a9c371a0c))


### Chores

* **driver:** update hekla p2p bootnodes ([#401](https://github.com/taikoxyz/simple-taiko-node/issues/401)) ([4ecf454](https://github.com/taikoxyz/simple-taiko-node/commit/4ecf454d844e03740035c88253127b7d42f6b36b))
* **hekla,driver,client:** add flag to enable p2p network ([#405](https://github.com/taikoxyz/simple-taiko-node/issues/405)) ([34bc59b](https://github.com/taikoxyz/simple-taiko-node/commit/34bc59b4fcdef55da163475a51e11da538eda931))

## [1.17.4](https://github.com/taikoxyz/simple-taiko-node/compare/v1.17.3...v1.17.4) (2025-07-19)


### Chores

* **driver, prover, :** update versions ([#399](https://github.com/taikoxyz/simple-taiko-node/issues/399)) ([d0a79df](https://github.com/taikoxyz/simple-taiko-node/commit/d0a79df92c6adab6c60e0888b970473f786f0a8a))

## [1.17.3](https://github.com/taikoxyz/simple-taiko-node/compare/v1.17.2...v1.17.3) (2025-07-09)


### Chores

* **docker:** bump client hotfix version ([#397](https://github.com/taikoxyz/simple-taiko-node/issues/397)) ([b420668](https://github.com/taikoxyz/simple-taiko-node/commit/b420668d0226e70db9a7822e79d891a44256916a))

## [1.17.2](https://github.com/taikoxyz/simple-taiko-node/compare/v1.17.1...v1.17.2) (2025-06-06)


### Chores

* **docker:** update images and remove leftover proposer profile ([#394](https://github.com/taikoxyz/simple-taiko-node/issues/394)) ([fc89a0d](https://github.com/taikoxyz/simple-taiko-node/commit/fc89a0dad18f4916dbb30c8b2ada00e56e2c1814))

## [1.17.1](https://github.com/taikoxyz/simple-taiko-node/compare/v1.17.0...v1.17.1) (2025-06-05)


### Chores

* **docker:** remove hekla proposer profile ([#392](https://github.com/taikoxyz/simple-taiko-node/issues/392)) ([07a1da9](https://github.com/taikoxyz/simple-taiko-node/commit/07a1da9143955e4b633e1bae31104da19fe3c9db))

## [1.17.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.16.1...v1.17.0) (2025-06-03)


### Features

* **docker:** update flags/script for preconfs ([#389](https://github.com/taikoxyz/simple-taiko-node/issues/389)) ([61886f2](https://github.com/taikoxyz/simple-taiko-node/commit/61886f2ed94fd2d69c0a6d3aa8e99c37aa0b500c))

## [1.16.1](https://github.com/taikoxyz/simple-taiko-node/compare/v1.16.0...v1.16.1) (2025-05-21)


### Bug Fixes

* **docker:** hotfix image for mainnet ([#387](https://github.com/taikoxyz/simple-taiko-node/issues/387)) ([8358fae](https://github.com/taikoxyz/simple-taiko-node/commit/8358fae4cc417e6d6294e4bf84e4be228d967d7b))

## [1.16.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.15.0...v1.16.0) (2025-05-16)


### Features

* **docker:** updates for Mainnet `Pacaya` fork ([#385](https://github.com/taikoxyz/simple-taiko-node/issues/385)) ([171cec3](https://github.com/taikoxyz/simple-taiko-node/commit/171cec3afacbb3a923e5e1be8e684d7d9b0fe5d5))

## [1.15.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.14.0...v1.15.0) (2025-04-30)


### Features

* **docker:** update mainnet tags for Pectra fork ([#383](https://github.com/taikoxyz/simple-taiko-node/issues/383)) ([6821768](https://github.com/taikoxyz/simple-taiko-node/commit/6821768e2ee958b905bb567854edea6b174721f3))

## [1.14.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.13.1...v1.14.0) (2025-04-11)


### Features

* **docker:** bump Hekla tags for `sgx_geth` ([#381](https://github.com/taikoxyz/simple-taiko-node/issues/381)) ([4ec6ccf](https://github.com/taikoxyz/simple-taiko-node/commit/4ec6ccfdf6fb276a08ae415ce6b7326a3adeb4ed))

## [1.13.1](https://github.com/taikoxyz/simple-taiko-node/compare/v1.13.0...v1.13.1) (2025-03-28)


### Bug Fixes

* **hekla:** bump Hekla Pacaya tags ([#378](https://github.com/taikoxyz/simple-taiko-node/issues/378)) ([52a4ba2](https://github.com/taikoxyz/simple-taiko-node/commit/52a4ba2fdacb660feb8877b03e151739f57ba04a))

## [1.13.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.12.0...v1.13.0) (2025-03-27)


### Features

* **docker:** bump Hekla tags ([#376](https://github.com/taikoxyz/simple-taiko-node/issues/376)) ([62fd167](https://github.com/taikoxyz/simple-taiko-node/commit/62fd167afd462a2175d8d614d9ff3d9367d33528))

## [1.12.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.11.0...v1.12.0) (2025-03-24)


### Features

* **repo:** update Hekla image tags for Pacaya fork ([#374](https://github.com/taikoxyz/simple-taiko-node/issues/374)) ([d1182fb](https://github.com/taikoxyz/simple-taiko-node/commit/d1182fbe148150350b5cef8cea59f0fc9e27ebcc))

## [1.11.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.10.3...v1.11.0) (2025-03-24)


### Features

* **hekla:** bump client tags ([#373](https://github.com/taikoxyz/simple-taiko-node/issues/373)) ([451dab3](https://github.com/taikoxyz/simple-taiko-node/commit/451dab300b85f942bd58dc1aaf6fc290cd287332))
* **hekla:** update tags for Hekla ([#371](https://github.com/taikoxyz/simple-taiko-node/issues/371)) ([f2a4af7](https://github.com/taikoxyz/simple-taiko-node/commit/f2a4af77a4b960ed1046aad1d53aed23717a8043))
* **repo:** update Hekla image tags for Pacaya fork ([#369](https://github.com/taikoxyz/simple-taiko-node/issues/369)) ([0f1e3b1](https://github.com/taikoxyz/simple-taiko-node/commit/0f1e3b1bee713735e9f44469913fa6645f09de82))


### Chores

* **proposer:** fix env var name ([#372](https://github.com/taikoxyz/simple-taiko-node/issues/372)) ([cea04e4](https://github.com/taikoxyz/simple-taiko-node/commit/cea04e4a336b3da7f6edf5dd341e442a5a0a05ca))

## [1.10.3](https://github.com/taikoxyz/simple-taiko-node/compare/v1.10.2...v1.10.3) (2025-02-25)


### Chores

* **docker:** update Hekla `taiko-client` tags ([#367](https://github.com/taikoxyz/simple-taiko-node/issues/367)) ([a4ac24f](https://github.com/taikoxyz/simple-taiko-node/commit/a4ac24ffb273e0458203c54e14859684a688c996))

## [1.10.2](https://github.com/taikoxyz/simple-taiko-node/compare/v1.10.1...v1.10.2) (2025-02-14)


### Bug Fixes

* **prover:** remove deprecated flag ([#366](https://github.com/taikoxyz/simple-taiko-node/issues/366)) ([ce0354f](https://github.com/taikoxyz/simple-taiko-node/commit/ce0354f7b22b06d8cc30589f2887ddd7b66db3e0))
* **repo:** fix link in readme ([#364](https://github.com/taikoxyz/simple-taiko-node/issues/364)) ([f6871ae](https://github.com/taikoxyz/simple-taiko-node/commit/f6871aeebd518999949dd74e848efa526fa24f45))

## [1.10.1](https://github.com/taikoxyz/simple-taiko-node/compare/v1.10.0...v1.10.1) (2025-02-06)


### Bug Fixes

* **driver:** fix image tag ([#362](https://github.com/taikoxyz/simple-taiko-node/issues/362)) ([8671583](https://github.com/taikoxyz/simple-taiko-node/commit/86715839fcb38e7338165b5f43298b842861239d))

## [1.10.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.9.1...v1.10.0) (2025-02-04)


### Features

* **repo:** bump client version ([#360](https://github.com/taikoxyz/simple-taiko-node/issues/360)) ([317b66f](https://github.com/taikoxyz/simple-taiko-node/commit/317b66facb1dbbcf544842e10434e50f1cab0d13))

## [1.9.1](https://github.com/taikoxyz/simple-taiko-node/compare/v1.9.0...v1.9.1) (2025-01-31)


### Bug Fixes

* **prover,proposer:** script fixes ([#358](https://github.com/taikoxyz/simple-taiko-node/issues/358)) ([6d06a90](https://github.com/taikoxyz/simple-taiko-node/commit/6d06a9096e0ecdb4b169c18b3c690a7b71615bea))


### Chores

* **env:** add disclaimer for revert protection ([#356](https://github.com/taikoxyz/simple-taiko-node/issues/356)) ([5da07b3](https://github.com/taikoxyz/simple-taiko-node/commit/5da07b387b72c4ec62a0157187fa2339b842c97d))
* **l2ee:** upgrade geth version ([#359](https://github.com/taikoxyz/simple-taiko-node/issues/359)) ([7fd1b29](https://github.com/taikoxyz/simple-taiko-node/commit/7fd1b2913730828e827347b9bbd6fd90abd7d2b0))

## [1.9.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.8.2...v1.9.0) (2025-01-20)


### Features

* **driver,prover,proposer:** bump  client version ([#353](https://github.com/taikoxyz/simple-taiko-node/issues/353)) ([02fa9b6](https://github.com/taikoxyz/simple-taiko-node/commit/02fa9b6aafde655a5db56b656e7d60a9a85bdd88))

## [1.8.2](https://github.com/taikoxyz/simple-taiko-node/compare/v1.8.1...v1.8.2) (2025-01-15)


### Chores

* **env:** update `.env.sample.hekla` ([4bd0a2a](https://github.com/taikoxyz/simple-taiko-node/commit/4bd0a2a4cc1ff818fdbf75a8e4614cfdf77c5632))
* **prover,proposer,driver:** upgrade client version to `0.43.0` on Hekla ([#351](https://github.com/taikoxyz/simple-taiko-node/issues/351)) ([ff47aaf](https://github.com/taikoxyz/simple-taiko-node/commit/ff47aafee80e06d674e3bcb977bdfd5f45bd1e7d))

## [1.8.1](https://github.com/taikoxyz/simple-taiko-node/compare/v1.8.0...v1.8.1) (2024-10-24)


### Bug Fixes

* **proposer,driver,prover:** bump version ([#343](https://github.com/taikoxyz/simple-taiko-node/issues/343)) ([254fb8e](https://github.com/taikoxyz/simple-taiko-node/commit/254fb8ef10bec85ec467dada37dc3b8b9968a003))

## [1.8.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.7.0...v1.8.0) (2024-10-23)


### Features

* **env:** add TxMgr flag annotations ([#334](https://github.com/taikoxyz/simple-taiko-node/issues/334)) ([dd9322f](https://github.com/taikoxyz/simple-taiko-node/commit/dd9322f10f4d1fa7bc4e46daed9a5accb0581486))
* **hekla:** bump Hekla client tag ([#337](https://github.com/taikoxyz/simple-taiko-node/issues/337)) ([b575679](https://github.com/taikoxyz/simple-taiko-node/commit/b575679af1262f72426ada160596b586cf3cff99))
* **mainnet:** bump client version ([#336](https://github.com/taikoxyz/simple-taiko-node/issues/336)) ([9166881](https://github.com/taikoxyz/simple-taiko-node/commit/9166881fb0e9bb6025910f861143cc0720eba76e))
* **mainnet:** bump version ([#341](https://github.com/taikoxyz/simple-taiko-node/issues/341)) ([ec5868f](https://github.com/taikoxyz/simple-taiko-node/commit/ec5868f1f2ad6585193148b48f5ae2a32cdc9055))
* update tags for Hekla / mainnet ([#340](https://github.com/taikoxyz/simple-taiko-node/issues/340)) ([3884f86](https://github.com/taikoxyz/simple-taiko-node/commit/3884f860aa33d94a4c24450388e8634f96d243af))


### Chores

* **docker:** bump Hekla tags ([#338](https://github.com/taikoxyz/simple-taiko-node/issues/338)) ([6abe049](https://github.com/taikoxyz/simple-taiko-node/commit/6abe0490faae82aa6783df41ad668d42f0fc74a2))

## [1.7.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.6.0...v1.7.0) (2024-09-12)


### Features

* **env:** update Hekla && mainnet bootnodes ([#332](https://github.com/taikoxyz/simple-taiko-node/issues/332)) ([0955f43](https://github.com/taikoxyz/simple-taiko-node/commit/0955f43191fa62175d89a911b6d3085424b15d85))

## [1.6.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.5.0...v1.6.0) (2024-09-12)


### Features

* **prover,proposer,driver:** bump  client version ([#330](https://github.com/taikoxyz/simple-taiko-node/issues/330)) ([ce53ce2](https://github.com/taikoxyz/simple-taiko-node/commit/ce53ce22a63069adf5c84c01769117127b7e5403))

## [1.5.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.4.0...v1.5.0) (2024-09-11)


### Features

* **hekla:** bump client and l2ee version ([#326](https://github.com/taikoxyz/simple-taiko-node/issues/326)) ([2f6c06e](https://github.com/taikoxyz/simple-taiko-node/commit/2f6c06e0384f9bc7127795146d0d026558a4020e))
* **prover,proposer,driver:** bump l2ee and driver versions ([#329](https://github.com/taikoxyz/simple-taiko-node/issues/329)) ([6cfd9f1](https://github.com/taikoxyz/simple-taiko-node/commit/6cfd9f11197500b304038e8acd10ac4008e9379f))
* **prover:** remove unnecesary env in hekla .env.sample and fix ([#325](https://github.com/taikoxyz/simple-taiko-node/issues/325)) ([0db06a8](https://github.com/taikoxyz/simple-taiko-node/commit/0db06a8835bd7ca720865c709ee0e711c3350cb2))
* **prover:** update version of prover in hekla ([#323](https://github.com/taikoxyz/simple-taiko-node/issues/323)) ([8ecd3bc](https://github.com/taikoxyz/simple-taiko-node/commit/8ecd3bc7f9f9591fe448e044f7a48ca85a45d28c))


### Chores

* **hekla:** bump client & taiko-geth image version ([#327](https://github.com/taikoxyz/simple-taiko-node/issues/327)) ([09d77eb](https://github.com/taikoxyz/simple-taiko-node/commit/09d77ebc61506cf6fb67fd60b7ffba4325ee8c6f))
* **hekla:** bump client & taiko-geth image version ([#328](https://github.com/taikoxyz/simple-taiko-node/issues/328)) ([807926f](https://github.com/taikoxyz/simple-taiko-node/commit/807926fb9f0c27a9dbc756d345ceb65a81fcfdf0))

## [1.4.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.3.0...v1.4.0) (2024-07-18)


### Features

* **proposer:** support epoch.minTip ([#316](https://github.com/taikoxyz/simple-taiko-node/issues/316)) ([e8c1f9a](https://github.com/taikoxyz/simple-taiko-node/commit/e8c1f9a836865336149839b31e4f4529d13290c9))
* **repo:** add editorconfig ([#320](https://github.com/taikoxyz/simple-taiko-node/issues/320)) ([bc5a9d0](https://github.com/taikoxyz/simple-taiko-node/commit/bc5a9d00d6aad03d2abc21de084fdf442781edab))


### Bug Fixes

* double quotation ([#312](https://github.com/taikoxyz/simple-taiko-node/issues/312)) ([8d5be17](https://github.com/taikoxyz/simple-taiko-node/commit/8d5be172de0b49f75cf15b7e36a2c6f3ae7f9536))


### Chores

* **docker:** update geth image ([#321](https://github.com/taikoxyz/simple-taiko-node/issues/321)) ([246dbb3](https://github.com/taikoxyz/simple-taiko-node/commit/246dbb3fd93e35a76d19eb985a6225b2448ce1a1))


### Workflow

* **repo:** improving repo workflows/renaming ([#317](https://github.com/taikoxyz/simple-taiko-node/issues/317)) ([589456b](https://github.com/taikoxyz/simple-taiko-node/commit/589456b372378558804ed1ddd68ec0a9ab0c085d))

## [1.3.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.2.0...v1.3.0) (2024-07-08)


### Features

* **proposer:** remove unused `BLOCK_BUILDER_TIP` ([#309](https://github.com/taikoxyz/simple-taiko-node/issues/309)) ([f11e6be](https://github.com/taikoxyz/simple-taiko-node/commit/f11e6be27c8da1662154a0b06430a86f11ab6f1f))
* **proposer:** rm tier fee ([#310](https://github.com/taikoxyz/simple-taiko-node/issues/310)) ([aaf2ce0](https://github.com/taikoxyz/simple-taiko-node/commit/aaf2ce0665f3de8d69947d44ef8c7fa1521ee9b0))
* remove unused configs ([#305](https://github.com/taikoxyz/simple-taiko-node/issues/305)) ([073bf24](https://github.com/taikoxyz/simple-taiko-node/commit/073bf24be6557fcc80968b3ff24bd94de17f91c7))

## [1.2.0](https://github.com/taikoxyz/simple-taiko-node/compare/v1.1.0...v1.2.0) (2024-07-01)


### Features

* apply assignmenthook update for hekla  ([#301](https://github.com/taikoxyz/simple-taiko-node/issues/301)) ([db01c11](https://github.com/taikoxyz/simple-taiko-node/commit/db01c113d8952c888d8031afc50d8d9bf2969493))
* **mainnet:** bump client version ([#304](https://github.com/taikoxyz/simple-taiko-node/issues/304)) ([67bcff0](https://github.com/taikoxyz/simple-taiko-node/commit/67bcff0fb5abb3a00ac6abea07b2d18e8874c618))

## 1.0.0 (2024-05-30)


### Features

* add echo informing of the proposer being disabled before 'sleep infinity' ([#139](https://github.com/taikoxyz/simple-taiko-node/issues/139)) ([541c04b](https://github.com/taikoxyz/simple-taiko-node/commit/541c04b8348e2ad39b87dba3546aeebd9d604529))
* add update-env.sh util script ([#106](https://github.com/taikoxyz/simple-taiko-node/issues/106)) ([0a15475](https://github.com/taikoxyz/simple-taiko-node/commit/0a15475e43c6d68bf053cce1f0ed277cd9149ea8))
* **all:** add default `proposeBlockTxGasTipCap` flag value for proposers ([#110](https://github.com/taikoxyz/simple-taiko-node/issues/110)) ([6b084e2](https://github.com/taikoxyz/simple-taiko-node/commit/6b084e26be97b9c3566d94ed0eceaf33e88103e4))
* **all:** initial commit ([#1](https://github.com/taikoxyz/simple-taiko-node/issues/1)) ([c44176c](https://github.com/taikoxyz/simple-taiko-node/commit/c44176c6c5c017ceb5d945d3a8d348ee2b67d30a))
* **all:** update configurations for alpha-5 testnet ([#121](https://github.com/taikoxyz/simple-taiko-node/issues/121)) ([3f5347e](https://github.com/taikoxyz/simple-taiko-node/commit/3f5347e9a308ee37a3c7861d02b5705e7c4b66a7))
* **alpha-3:** add more bootnodes ([#58](https://github.com/taikoxyz/simple-taiko-node/issues/58)) ([76de101](https://github.com/taikoxyz/simple-taiko-node/commit/76de101a175c9185421da22579f90dabb9ea1f38))
* **alpha-4:** add Eldfell network configs ([#67](https://github.com/taikoxyz/simple-taiko-node/issues/67)) ([d34b96b](https://github.com/taikoxyz/simple-taiko-node/commit/d34b96b062d19a0562398202aca2b597e81f6a5b))
* **alpha-6:** add `Katla` network configs ([#158](https://github.com/taikoxyz/simple-taiko-node/issues/158)) ([bf1d2a2](https://github.com/taikoxyz/simple-taiko-node/commit/bf1d2a2b59bcdb6f702d3cb56ac6781ed134ea88))
* **chore:** update docker-compose configurations ([#53](https://github.com/taikoxyz/simple-taiko-node/issues/53)) ([3ee89e7](https://github.com/taikoxyz/simple-taiko-node/commit/3ee89e7bd47dfc0c640298641e434f253169eec9))
* docker-compose.yml formatting ([#225](https://github.com/taikoxyz/simple-taiko-node/issues/225)) ([0ca3155](https://github.com/taikoxyz/simple-taiko-node/commit/0ca3155fc29840857204e6c0a32e73eb6eafb78f))
* **eldfell:** add `PROVE_UNASSIGNED_BLOCKS` env ([#69](https://github.com/taikoxyz/simple-taiko-node/issues/69)) ([1d6e1cd](https://github.com/taikoxyz/simple-taiko-node/commit/1d6e1cd5be8fe55568ff349cf0ca3ef16440f835))
* **eldfell:** increase zkevm-chain-rpcd wait timeout ([#73](https://github.com/taikoxyz/simple-taiko-node/issues/73)) ([d9e6586](https://github.com/taikoxyz/simple-taiko-node/commit/d9e6586bbb941095e60ac6e506622d9a7139df2a))
* **eldfell:** update `PORT_L3_EXECTION_ENGINE_HTTP` && `PORT_L3_EXECTION_ENGINE_WS` ([#68](https://github.com/taikoxyz/simple-taiko-node/issues/68)) ([3a75489](https://github.com/taikoxyz/simple-taiko-node/commit/3a75489a28b3c3cde17462f0bd4fdef04a680c01))
* **eldfell:** update default bootnodes ([#98](https://github.com/taikoxyz/simple-taiko-node/issues/98)) ([2b8d662](https://github.com/taikoxyz/simple-taiko-node/commit/2b8d6620dc2e8ae146cc9812ca02fc9bfe96ad24))
* **eldfell:** update service names ([#70](https://github.com/taikoxyz/simple-taiko-node/issues/70)) ([e7cb642](https://github.com/taikoxyz/simple-taiko-node/commit/e7cb6425bbf7d1c5972888c33f1bd70d573c1c96))
* **env:** use golden touch account as `L2_THROWAWAY_BLOCK_BUILDER` ([#12](https://github.com/taikoxyz/simple-taiko-node/issues/12)) ([fc4de37](https://github.com/taikoxyz/simple-taiko-node/commit/fc4de37d2b16a9c3b2c2c963bf4809395cc7482f))
* **grimsvotn:** add `DISABLE_P2P_SYNC` option ([#57](https://github.com/taikoxyz/simple-taiko-node/issues/57)) ([55cc163](https://github.com/taikoxyz/simple-taiko-node/commit/55cc16384591b5b84f14f0ce3ea55a7a36125ebe))
* **grimsvotn:** update A3 zkevm-chain-prover-rpcd memory limit ([#95](https://github.com/taikoxyz/simple-taiko-node/issues/95)) ([836d217](https://github.com/taikoxyz/simple-taiko-node/commit/836d217185be902d769cff2f7a2b0ca536d75e44))
* **grímsvötn:** update p2p sync timeout config ([#56](https://github.com/taikoxyz/simple-taiko-node/issues/56)) ([c1b5cd0](https://github.com/taikoxyz/simple-taiko-node/commit/c1b5cd02bff6f8502b0a842ab2b89f72babfcbec))
* handle unix signals ([#224](https://github.com/taikoxyz/simple-taiko-node/issues/224)) ([247ef63](https://github.com/taikoxyz/simple-taiko-node/commit/247ef6382e17f9f1aa381440348dc4d13e3c2558))
* **hekla:** introduce `--gpo.ignoreprice` flag ([#247](https://github.com/taikoxyz/simple-taiko-node/issues/247)) ([e5221f2](https://github.com/taikoxyz/simple-taiko-node/commit/e5221f24a418cb6fa49b95a41c15edcedefa0779))
* **hekla:** modify `simple-taiko-node` for hekla  ([#205](https://github.com/taikoxyz/simple-taiko-node/issues/205)) ([b0a1b21](https://github.com/taikoxyz/simple-taiko-node/commit/b0a1b211a8d1e6610ea3ad8c31594faba4adc37d))
* **hekla:** update default `TX_GAS_LIMIT` config ([#209](https://github.com/taikoxyz/simple-taiko-node/issues/209)) ([e75f5f0](https://github.com/taikoxyz/simple-taiko-node/commit/e75f5f05027c59e17d0b31122119ede035f6f2b6))
* **jolnir:** update default gas limit configurations ([#129](https://github.com/taikoxyz/simple-taiko-node/issues/129)) ([96c48a5](https://github.com/taikoxyz/simple-taiko-node/commit/96c48a5b2c3a5b8f42e5a29305482de46644305b))
* **katla:** improve `start-zkevm-chain-rpcd.sh` ([#164](https://github.com/taikoxyz/simple-taiko-node/issues/164)) ([e56a6e7](https://github.com/taikoxyz/simple-taiko-node/commit/e56a6e754774f703817ea5213968c4c6f576bcd0))
* **log:** add `PROVER IS DISABLED` log ([#178](https://github.com/taikoxyz/simple-taiko-node/issues/178)) ([25af49c](https://github.com/taikoxyz/simple-taiko-node/commit/25af49c14687cc8345394f690f5c94ce8aa4c6ae))
* **mainnet:** update mainnet configs ([#276](https://github.com/taikoxyz/simple-taiko-node/issues/276)) ([ebe5bd7](https://github.com/taikoxyz/simple-taiko-node/commit/ebe5bd726915c3ff17c0f9c8b7f6c5f70e826515))
* **node:** set locals in node ([#92](https://github.com/taikoxyz/simple-taiko-node/issues/92)) ([08a5b0d](https://github.com/taikoxyz/simple-taiko-node/commit/08a5b0d132bd16646dc8c10ee575ed0978f45a4c))
* **proposer:** proposer can only propose local transactions ([#91](https://github.com/taikoxyz/simple-taiko-node/issues/91)) ([8ba42aa](https://github.com/taikoxyz/simple-taiko-node/commit/8ba42aa089d356ea61f882f9dfc2a0091bde2476))
* **proposer:** Proposer gas limit + script refactor ([#101](https://github.com/taikoxyz/simple-taiko-node/issues/101)) ([17f1d0c](https://github.com/taikoxyz/simple-taiko-node/commit/17f1d0c495e146b8668c77e6c225605f586da4c3))
* **proposer:** update proposer RPC config temporarily ([#26](https://github.com/taikoxyz/simple-taiko-node/issues/26)) ([23eb266](https://github.com/taikoxyz/simple-taiko-node/commit/23eb266addf42fdd9e80ca2c7d66e400fc38c5dd))
* **proposer:** wait receipt timeout flags + refactor prover scripts ([#104](https://github.com/taikoxyz/simple-taiko-node/issues/104)) ([e76acb9](https://github.com/taikoxyz/simple-taiko-node/commit/e76acb94f888863d825b2c3f6c5be1c393552cac))
* **prover:** add proof skip size config for L3 ([#118](https://github.com/taikoxyz/simple-taiko-node/issues/118)) ([569592a](https://github.com/taikoxyz/simple-taiko-node/commit/569592a0c3d404a3fbfba99668b2cddd3b379429))
* **prover:** add prove block tx gas limit flag  ([#115](https://github.com/taikoxyz/simple-taiko-node/issues/115)) ([42d62bc](https://github.com/taikoxyz/simple-taiko-node/commit/42d62bc24b074b5c3ccdc79b227963d4fbaee1d3))
* **prover:** support running node and sgx prover on different servers ([#221](https://github.com/taikoxyz/simple-taiko-node/issues/221)) ([e84507a](https://github.com/taikoxyz/simple-taiko-node/commit/e84507acf1a280b2838f66b00e1948eba88c0f0e))
* **repo:** enable OpenAI-based review ([#52](https://github.com/taikoxyz/simple-taiko-node/issues/52)) ([6d0d863](https://github.com/taikoxyz/simple-taiko-node/commit/6d0d863b1341ee158da946ffa2c78d08afcc65c6))
* rm useless config ([#281](https://github.com/taikoxyz/simple-taiko-node/issues/281)) ([eebfffa](https://github.com/taikoxyz/simple-taiko-node/commit/eebfffa82ff7c1a5eeddbd549cc7371914ed323a))
* **script:** add condition to check requirement variables for proposer/prover ([#238](https://github.com/taikoxyz/simple-taiko-node/issues/238)) ([fca0c9a](https://github.com/taikoxyz/simple-taiko-node/commit/fca0c9ae061085f4d11b1abf9452b71f9ed58cbd))
* set default home dashboard ([#174](https://github.com/taikoxyz/simple-taiko-node/issues/174)) ([63a9aa7](https://github.com/taikoxyz/simple-taiko-node/commit/63a9aa7010b81da18e2a68dda767bf66e2020f05))
* start multiple `zkevm-chain` provers ([#94](https://github.com/taikoxyz/simple-taiko-node/issues/94)) ([2d12441](https://github.com/taikoxyz/simple-taiko-node/commit/2d12441c0743192701443c86bd337f463d609376))
* update default ports ([#89](https://github.com/taikoxyz/simple-taiko-node/issues/89)) ([27b902e](https://github.com/taikoxyz/simple-taiko-node/commit/27b902eee8dab2d1c3dea3a6fbb32b1907f6ab5f))
* update sync timeout ([#59](https://github.com/taikoxyz/simple-taiko-node/issues/59)) ([cfbc2a0](https://github.com/taikoxyz/simple-taiko-node/commit/cfbc2a02b95304382c424dd2c752646799647bc8))


### Bug Fixes

* add backwards compat for new env var and small typo ([#96](https://github.com/taikoxyz/simple-taiko-node/issues/96)) ([f7610ad](https://github.com/taikoxyz/simple-taiko-node/commit/f7610ad4902c2d23df45deab8678fe8d66d1b71e))
* add default value for `GETH_ADDITIONAL_ARGS` ([#267](https://github.com/taikoxyz/simple-taiko-node/issues/267)) ([aec2678](https://github.com/taikoxyz/simple-taiko-node/commit/aec2678258dcd6d1272e6bbd9f023129f06931c9))
* **docker-compose:** make hard-coded prover's port dynamic ([#41](https://github.com/taikoxyz/simple-taiko-node/issues/41)) ([8c08689](https://github.com/taikoxyz/simple-taiko-node/commit/8c0868924adbb558fb2d6f2178923d95428b51d3))
* **docs:** correct IP format in `.env.sample` endpoints ([#170](https://github.com/taikoxyz/simple-taiko-node/issues/170)) ([3bf68cd](https://github.com/taikoxyz/simple-taiko-node/commit/3bf68cda84997082fb3ecdcc48d0aa668e4f9996))
* **eldfell:** fix `--proveUnassignedBlocks` flag setting ([#109](https://github.com/taikoxyz/simple-taiko-node/issues/109)) ([0a86e18](https://github.com/taikoxyz/simple-taiko-node/commit/0a86e18dfa0a038f8d36c8793870326e8fd4e96e))
* **eldfell:** fix zkevm-chain-proverd port in prover relayer script ([#72](https://github.com/taikoxyz/simple-taiko-node/issues/72)) ([dee982e](https://github.com/taikoxyz/simple-taiko-node/commit/dee982e27ee8a14dac09bb6b084fef804a8cd9d4))
* **eldfell:** make zkevm-rpcd-chain port number explicit ([#71](https://github.com/taikoxyz/simple-taiko-node/issues/71)) ([38d2114](https://github.com/taikoxyz/simple-taiko-node/commit/38d2114ca1e68a70e574f129c7fa3e02677d3904))
* **eldfell:** update zkevm-chain-rpcd host ([#75](https://github.com/taikoxyz/simple-taiko-node/issues/75)) ([5a63f47](https://github.com/taikoxyz/simple-taiko-node/commit/5a63f47ca5fce97fc32cfc05fbbb4ac8d3e39beb))
* **eldfell:** Use correct env flag in start-prover-relayer.sh ([#79](https://github.com/taikoxyz/simple-taiko-node/issues/79)) ([9c1cdba](https://github.com/taikoxyz/simple-taiko-node/commit/9c1cdba5d730ae3cc5ba50656d797e3db18d28b1))
* **eldfell:** Use env variable for port assignment in start-zkevm-chain-rpcd.sh ([#77](https://github.com/taikoxyz/simple-taiko-node/issues/77)) ([a1dfb6d](https://github.com/taikoxyz/simple-taiko-node/commit/a1dfb6d26fa35e43a9e81dca1f720d67224272a0))
* **env:** fix sample env file formatting ([7c15a6d](https://github.com/taikoxyz/simple-taiko-node/commit/7c15a6d790abd09471cc4aeb23bcc1144525b93e))
* **env:** Update for .env.sample.l3 ([#99](https://github.com/taikoxyz/simple-taiko-node/issues/99)) ([4b6ab2a](https://github.com/taikoxyz/simple-taiko-node/commit/4b6ab2af4020bbde30b0c863706e1c6e82c97b2d))
* **env:** update sample env files ([#90](https://github.com/taikoxyz/simple-taiko-node/issues/90)) ([a62598d](https://github.com/taikoxyz/simple-taiko-node/commit/a62598d7fb026fbf0fc9d07ba408ff98cde8942c))
* **grafana:** set `'Instant'` as default query type for instant metrics ([#251](https://github.com/taikoxyz/simple-taiko-node/issues/251)) ([9201f1a](https://github.com/taikoxyz/simple-taiko-node/commit/9201f1aabf73b6ee97cb093d3517cb634df43ee6))
* **grimsvotn:** fix `start-prover-relayer.sh` script ([#108](https://github.com/taikoxyz/simple-taiko-node/issues/108)) ([f83afaa](https://github.com/taikoxyz/simple-taiko-node/commit/f83afaa6936981e94cda328336db5a92641157f7))
* l3 grafana dashboard ([#88](https://github.com/taikoxyz/simple-taiko-node/issues/88)) ([8f4e9ba](https://github.com/taikoxyz/simple-taiko-node/commit/8f4e9bab90de80bdc886c2e32ef4b13ccc6d8333))
* **node:** Typo fix spelling EXECUTION .env and yml files ([#119](https://github.com/taikoxyz/simple-taiko-node/issues/119)) ([d5f46aa](https://github.com/taikoxyz/simple-taiko-node/commit/d5f46aab36f90d352b48929eeb91d19270525da3))
* **proposer:** check enabled before args ([#255](https://github.com/taikoxyz/simple-taiko-node/issues/255)) ([d54b0dd](https://github.com/taikoxyz/simple-taiko-node/commit/d54b0dd0205a2709b0505cf5cc791889a2cdbe7e))
* **proposer:** fix proposer var ([#256](https://github.com/taikoxyz/simple-taiko-node/issues/256)) ([d9afb56](https://github.com/taikoxyz/simple-taiko-node/commit/d9afb56f9beb7b8dc26d7f13c4d8795bede8f771))
* **prover:** reorder script args ([#204](https://github.com/taikoxyz/simple-taiko-node/issues/204)) ([df19538](https://github.com/taikoxyz/simple-taiko-node/commit/df19538417978c8f822fe1b71b46cbbd8a041ecf))
* **repo:** fix openAI review workflow ([#54](https://github.com/taikoxyz/simple-taiko-node/issues/54)) ([d8896cf](https://github.com/taikoxyz/simple-taiko-node/commit/d8896cf2c0e94fb1c0da36a1cb9b2df658f5c17e))
* **script:** use docker internal port ([#45](https://github.com/taikoxyz/simple-taiko-node/issues/45)) ([1ef326a](https://github.com/taikoxyz/simple-taiko-node/commit/1ef326a8afbdceee159f051b6c35d3277750cab0))
* update docker-compose.yml for better p2p configuration ([#258](https://github.com/taikoxyz/simple-taiko-node/issues/258)) ([bce9544](https://github.com/taikoxyz/simple-taiko-node/commit/bce95442c8e2840ece0daca4138eea26e8e50e22))
