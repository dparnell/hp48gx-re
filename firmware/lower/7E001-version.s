* HP 48GX ROM revision R, #7E001-#7FFFF: Fill and version strings
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: VersionStrings
* Follows on from the previous file (at #7E001 in the original ROM).
        FILLTO  #7FFA0                           * 7E001  8095 zero nibbles: the next entry stays at #7FFA0
        RPL

* Version and copyright strings (VERSION reads them through # VersionStrings)
VersionStrings:
        ::                                       * 7FFA0
          $       "Version HP48-R"               * 7FFA5
          $       "Copyright HP 1993"            * 7FFCB
        ;                                        * 7FFF7

        CRC                                      * 7FFFC  self-test CRC correction (computed by the assembler)
