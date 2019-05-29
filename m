Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5C4887E38D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 14:11:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45DXgp0RmGz3L;
	Wed, 29 May 2019 16:11:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559139078;
	bh=yo/tTsJ2cAAaTu5i1JYhCqa8pDnKwCF9yAf3AbYzXL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r6ljzcnAJfcWt4x10HViTQ38t/pObdxHJ9H3A8OiibGvQ5lKe0ow7c+kcMBnYCW2U
	LY6SdJ4or7P//D2eE5mNwWMpqczsBQoRppj2gqBXTDnSc60LqFfAzVIdV600EcqhcE
	lqEx3ZdiHlczz9w0KFSf7gNDBwN3aIoRzOPvm3M53BMATkL4+ElrrTXogCjFZM1Dgf
	ocgSEhN/UkyJ442nwx6M7/rCjBtS0q9L/zyb355EfaUkm+vcw/Q3bn9fPMWSQ9Onxc
	SeEJGBDtennHi45s03VRnQgm+GhAZgZjMF4NBAtG/nSEx450LSvZzCKlBkfTMIm6Vr
	nlKaACCbCNZ/wUZT6gaQx3PqkpYL+hw+aKSeQxwU9NffpTtqFQu0N3QKBrXbVCajZU
	YqI90kLZqB9w/MgvPL3FEDOcEdLNFe/T24lE/YXJ8zAvOa44N1xeqWgXr2t5h9sTo8
	wj4ikPO3yqLwSEjaJLlaHgYxIRYyjqHBKN8nj9oKHFmCeM+2xMrHbicwDYMuHaSLIx
	UFhGjyc5v1qK+r7/uXJ5DdRTGbU8S5cPgwtzVViOytZM8BO+mfx7L/DG7aougvidG4
	KWhUWGUysNhY9cC7/yjYlm1XPBgm7NSxC+yYoO7vLx3VpAd9bCo1Qb87hxYAzfD8ql
	abaEX31I2Wkrw1Id/C3g4DHU=
Date: Wed, 29 May 2019 17:11:16 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190529141116.GC28892@localhost>
References: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH 0/9] Fixes for Thud
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 May 2019 14:11:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 29, 2019 at 06:50:29AM -0700, Armin Kuster wrote:
>..
> Mingli Yu (2):
>   nettle: fix ptest failure
>...
> Richard Purdie (1):
>   Revert "nettle: fix ptest failure"
>...

These should be dropped for obvious reasons.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


