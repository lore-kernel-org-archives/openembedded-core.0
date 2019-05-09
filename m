Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 77B9D7DFE3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 12:23:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450CDG4cyyz5c;
	Thu,  9 May 2019 14:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557404592;
	bh=/jlSkTuG0TtJ1Fej3Sj41CMIV/t/LSMSxDSPKn9EtMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=beKYVFdeGFO3GVkWv/dt0hvdftOPdL+0GiuKaCsKxOPsiqFALbDZyHVHKOO1D4afj
	tPYgSe1YHp441PJOy1bshY+wdRuuM4HMl6DhiudqefaTZuqJgHbpY1p9Pr3dfRzRAn
	tKZ+e0CQB85jQlfk3DjQ/Pri+ofXU20/dU/pc7JNV/gLQfKDjv3apPIIIiu1qCKdnJ
	cJbXpydR+K+nieuTn0YBPkTjFuunmw+dDOfxgKcvvGNo2OFjlVaUbK52guMunZqT8G
	34V5EAx/7WcZOyFX7bdRZWIQ/plTqg3SeUuu9JePqFC4RzNbwkgkE3n7w8PyogspGR
	n5X3NP6nyTB+aT44hLOPPC8NAJ8+WQidsCR6JKhteufssyU5kDBG/m1JJ3mxLmE6Yq
	V6x8eP3y0uSE4VxtLPKQh65t0TVExwUncnMy3TzaQsAISmNc2Caw7zhIVsjjv9boQH
	VnBHlzhlmgcgb0mM44b9FuY+n+FnXjWDbFd1qoe08LHCqBz4dYUXq0iAe3hSowdKdz
	/iaD1NfzQ91jwEKmlbLjAkcEdMrOIpOrlwTEYQ3/TN02n2VJyejrO/YoGTKo9QM97z
	clluLyxVHN7bnA5W31aNyKf8QMYPbvHskm4rJALc9qHoADsXJR5wOdwEtlzAVHfclK
	Uo759sQEebWyp34+7WyEpBtM=
Date: Thu, 9 May 2019 15:23:08 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Kevin Hao <kexin.hao@windriver.com>
Message-ID: <20190509122308.GA24554@localhost>
References: <20190507131151.31070-12-bunk@stusta.de>
	<2396569c84a5fa3ababe93d837c025bce876cd40.camel@linuxfoundation.org>
	<20190508203052.GC18736@localhost>
	<7f99a5accb9261548f88e3f2787bad806eb5dd05.camel@linuxfoundation.org>
	<20190509120954.GV803@pek-khao-d2.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <20190509120954.GV803@pek-khao-d2.corp.ad.wrs.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng-modules: upgrade 2.10.8 -> 2.10.9
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
X-List-Received-Date: Thu, 09 May 2019 12:23:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 09, 2019 at 08:09:54PM +0800, Kevin Hao wrote:
> 
> I just sent out a patch to bump the kernel version for these BSPs.

Thanks a lot!

> Thanks,
> Kevin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


