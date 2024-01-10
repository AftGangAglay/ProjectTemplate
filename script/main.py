# SPDX-License-Identifier: 0BSD
# Copyright (C) 2024 Emily "TTG" Banerjee <prs.ttg+aga@pm.me>

import aga

class game():
    def create(self):
        aga.log('I wake!')
        return self
    #
    def update(self):
        aga.clear([ 0.8, 0.3, 0.2, 1.0 ])
        aga.text('Hello, AftGangAglay!', [ 0.1, 0.1 ])
    #
    def close(self):
        pass
