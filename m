Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DE56460069
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 17:04:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44xFjQ5syFz2C;
	Sat,  4 May 2019 19:04:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1556989483;
	bh=tv48U7eLnDL9YAijllpfIFxy+6kJBkRxPX676k91E1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RftoMgLlHkciQ+o76C3C+bqDdcDTV4Xjzp7oapZkoClPzGOlZ2WYWIef05RttYGQJ
	SIzyp/+rOvVJki8ITR3lAK1mN2KyzxRlM8cSE/8EKlRqeRJX8eppYW3s4WAD7ZZkha
	6/JNIAKW0Q8E3VFq6gGKTEgQ4wyNoURBGMby2wRs70t5imm5mlDKtFK1W2veRPO+rm
	QjmF9CMBfLF2rk8oBXCNiVltqvUT2jfXBVqbNWic++9zJRBBaQiAf+HJfCoV3Xwbbj
	BAm9GOmKwoA9gC/vblh5p3QURNGcYH7l62du7YdT10WFMG92aPU5z23mPyJ1ZX2v6G
	74ACOy481QAzGwgGwgun0JHD39KA0xB+m3EfPcaiUKSRfRhT01+femN1B/TGX4y+SZ
	+g3sezf3GIVnePvWaKX5EnRDi8c8CD4wDLe8p5Qzk5D3OHAbrftZll0pq9Vk1eixem
	Pjk8Hsm2YEVx55UFHuhMZKiIlwIvkZvAllefRg4xJm2Gqm/FeTtD/Y8Oc+VHOTbyz0
	aEf/w2Z4vDGl+Pavw95PrvasOL/5dPwRjEf4/2+xe2vjEVqeKeHb9rg5W/C4Qk+8YW
	SWQlpL2tvpUVT/wBPgW1h1okWOMaHVEqFJGdP9IuN5VyVttl+z+S7/3q6xEhdm0TDz
	41uTU7WL6nVC+zB1HGmMtpBQ=
Date: Sat, 4 May 2019 20:04:40 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190504170440.GG11633@localhost>
References: <cover.1556983501.git.akuster808@gmail.com>
	<ca1292c6521c353c8203e7b1e1a4ec72b09baf21.1556983501.git.akuster808@gmail.com>
	<20190504160452.GD11633@localhost>
	<40c9204e-cdc9-18b4-df2d-6f6dbc8a1a62@gmail.com>
MIME-Version: 1.0
In-Reply-To: <40c9204e-cdc9-18b4-df2d-6f6dbc8a1a62@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 33/43] gnome-doc-utils: Remove stale patch
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
X-List-Received-Date: Sat, 04 May 2019 17:04:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, May 04, 2019 at 09:58:47AM -0700, akuster808 wrote:
> 
> 
> On 5/4/19 9:04 AM, Adrian Bunk wrote:
> > On Sat, May 04, 2019 at 08:27:09AM -0700, Armin Kuster wrote:
> >> From: Adrian Bunk <bunk@stusta.de>
> >>
> >> The recipe was removed 3 years ago.
> >> ...
> > This is a pure cleanup change, not something that would be worth 
> > backporting to stable branches.
> Its fine IMHO and if here is another gnome-doc-utils patch, it has a
> higher chance of applying.

"The recipe was removed 3 years ago."

> - armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


