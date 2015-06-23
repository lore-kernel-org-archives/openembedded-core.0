Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 766DB60670
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 01:47:52 +0000 (UTC)
Received: by pdcu2 with SMTP id u2so23775159pdc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 18:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=dngflnP555SgKE6GiJGk/KV/NO3RzTm6JCMWks/daSk=;
	b=R0qb3Ce/bCmZnE8CFwRuHu0kPfOs+peRhDWsmBBAmNp3JaHrhTidvEK1oP5FXAehFk
	nsyFmCw+IEy1aPULjZplrtGY0+N0y33TegoGE9ZVUMWiqHLDWdLMsU0jPDeHMk1FyjU4
	YQxT+Kk0B9esQZlLcAjapFjLNCyj8KPYW1iv3jc0itrdG/wDIjmd08uWFCof/oomLsIi
	/TEWo94KWY5dyaVsqbjepbYbOunp123/ejzO5QPr7VQyOaIUJYC2YvtG4UtslntpSfeQ
	wkfe82dsfFe7bAKr4Gp9BlkFO5W8jB35u9vRWhEoByP4M28WmpOnkg844YvxHo6geUZQ
	HHdA==
X-Received: by 10.68.180.131 with SMTP id do3mr64052466pbc.42.1435024074066;
	Mon, 22 Jun 2015 18:47:54 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:eccd:4297:a72a:d01f?
	([2601:202:4000:1239:eccd:4297:a72a:d01f])
	by mx.google.com with ESMTPSA id
	iv7sm21183211pbc.20.2015.06.22.18.47.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jun 2015 18:47:52 -0700 (PDT)
Message-ID: <5588BAC3.9070204@gmail.com>
Date: Mon, 22 Jun 2015 18:47:47 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <5584374B.9040201@gmail.com> <20150619165928.GC2398@jama>
In-Reply-To: <20150619165928.GC2398@jama>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: DIzzy - Call for patches for OE-core by June 26th
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
X-List-Received-Date: Tue, 23 Jun 2015 01:47:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

I had 1/2 of them. got all of them now.

thanks.
- armin

On 06/19/2015 09:59 AM, Martin Jansa wrote:
> On Fri, Jun 19, 2015 at 08:37:47AM -0700, akuster808 wrote:
>> thanks,
>> Armin
>
> Are these already included?
>
> OE @ ~/openembedded-core $ git log origin/dizzy..contrib/jansa/dizzy-backports  --oneline
> 11db5b7 license.bbclass: set dirs for do_populate_lic_setscene
> 777db3a perf: add LIBNUMA_DEFINES
> d79409f squashfs-tools: build and install unsquashfs as well
> f369677 e2fsprogs: install populate-extfs.sh
> 2dbb375 mesa: update --with-llvm-shared-libs configure option
> d68cb5e test-dependencies.sh: strip only .bb suffix
>

