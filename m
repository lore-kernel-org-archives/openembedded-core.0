Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 592C97E630
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 09:56:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45GGtS0LWbz3l;
	Sat,  1 Jun 2019 11:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559382992;
	bh=GRw6rLGP7vcVbXYIYke8YuajrQQ/ICkeCSzc3eV223E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kcwBDhzFyumD3HrVnciUyrloqTHvKjW2L9YFGX440cEkRq4zK3fjwPN3ogjOzMHwN
	d6MCFMZ/nz3XO2py2BDsr8Lnsd3ZcQ6Jx1TmYY0U7srLJ8Hsw91gP/tB0LcL57Ok2A
	ab5vUqBwonuZgTD5ACNK6NFszF1uSWw9AaBBbYGWb1KHDQmShkmDSQtDsqdvZM7+l7
	n8OvqmRH7MLsh/wagmv8km2l50LLu0XmviKWwdLVnjIQdtbDat/vZ+41xMV0jq+gNV
	wp8bgn2Dh75QqJQmeVc6e0Efr6JoCnrFUESw+fGB2DK0wn/Rf3PX394iWpUr7AdNQU
	3Lb3GYCk/X4AeRl1PMbII0hcgbvTO8ioF5/hUrtSplsxXmyEtAqX8jRE0Ka3C2ZPJ8
	L6D1guIf8YV2w1P+eROCiCuLaM1oT8ip9s4iV6Qo6c0P7NI+AcTDxDGtOl2Ssq5dn0
	WRToSbxqWFxbW7Iwr+5/6t+8vL2KUCIyqtX7r7VbUxpIJzozJYsdhSJAdwlVWSql1h
	sGGvI7PyEy0kh/ReXa5/9O3HEqx9J6EFL7ulkBeeZ2j+t8M/05Pu/Oa2u8XyEBllgo
	UAmKpLLH7MbsAPxOLEcvteI+RyQ0PbKdHcYir+6tmfFOLW6IYZIS5xrzRNOeBomjCQ
	CdLmPY141V63N/tLIz9jM9aE=
Date: Sat, 1 Jun 2019 12:56:30 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190601095630.GC13687@localhost>
References: <1559349502-9721-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1559349502-9721-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH 1/2] wpa-supplicant: update to 2.7
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
X-List-Received-Date: Sat, 01 Jun 2019 09:56:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

This is a new major version from the upstream master branch,
not something that would be appropriate for a stable series.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


