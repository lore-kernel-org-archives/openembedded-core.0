Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (unknown [209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 21F0E6116C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 17:31:49 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id rl12so2643716iec.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 10:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8r/SWc3jYiSE2ntx3J0l54Ss2xYSuj1jeuXDLwjorXU=;
	b=SjpmqKdGfvpjVlOHmfnyLugkTLoDO190sj3/zIOP6xkyBCdD4jl2tGvkCHBTqULXjv
	Iw9JnJrIwDASono+VT3di+TXhVClKVa/B1T2LBsuBK6UqIVGexxwKu1rVzgtxk4hKKeA
	PwWV9CT2QWhpG60CDF6dENJUuzcF6ILEB9Hjc6B4BDTCXC3uedlVvYdf0jxScODRRGgK
	mRfSXqzpIHw7vNWJf+jCFGoxSCwpwv5PD/KfF283FPfHi5iux8SMCidiWxoR/weaxbTS
	Ujc+SqaB5uW1VG62svG3k19wjaVt5WAHAA33bUOmXqPseT1fsUHQt1GrHAXyY8G5wSmk
	gbbg==
X-Received: by 10.50.65.3 with SMTP id t3mr19200744igs.20.1400520710627; Mon,
	19 May 2014 10:31:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Mon, 19 May 2014 10:31:20 -0700 (PDT)
In-Reply-To: <7a92a9da4b308473462f49d608a71cd1d014fbdb.1400477731.git.Chong.Lu@windriver.com>
References: <cover.1400477731.git.Chong.Lu@windriver.com>
	<7a92a9da4b308473462f49d608a71cd1d014fbdb.1400477731.git.Chong.Lu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 May 2014 10:31:20 -0700
Message-ID: <CAMKF1sqhEE0HOqLZ9nQ=vUQQeCYw4eCxLTTG7-036vsmqS5TCA@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libpcre: Update to 8.35 version
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
X-List-Received-Date: Mon, 19 May 2014 17:31:52 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 18, 2014 at 10:36 PM, Chong Lu <Chong.Lu@windriver.com> wrote:
> -LIC_FILES_CHKSUM = "file://LICENCE;md5=0920cc1a9f7ba95464491fa83c86afd8"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=ded617e975f28e15952dc68b84a7ac1a"

what changed ?

