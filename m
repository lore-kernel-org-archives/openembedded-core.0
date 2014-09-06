Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id DA7AE713AF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Sep 2014 15:33:24 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id rp18so15628875iec.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Sep 2014 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Ksq4zlo4kquBqza2YCjqSUmDSBS9rcao/x510X8z/4c=;
	b=RfB0OtamK56kfGRoqHKLW0OWR0zjL0PE2P40B2eeWx0HkuSjlhxbg2PTatFlHmJOYf
	vCvHIps4AiBdgJBDmoHILF0b4Tarhz9SEEeXgifZKwUYyhXMQQJgSt9sOSgYGDA7rv9+
	0WqUzfEvgja+iuQLxPIDOXqiFcS0XVRmCytD8yU8zH69v/0qawJCJyxve6wHA5Ux0A/p
	Yz9Xbw6V9nvAvyyzrKRJbsR95OGD/y6ERLgxSMFGV55YBw0id0CP1zg7FvpaDAkbhB/b
	BpwlHi1SVyGXLCLY6GH1q7cuO5T1WRn6ARwXqDAFtms9yNcHptjaAOTBIkt456G+8FlM
	+Drw==
X-Received: by 10.50.111.112 with SMTP id ih16mr12521319igb.30.1410017605484; 
	Sat, 06 Sep 2014 08:33:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Sat, 6 Sep 2014 08:32:55 -0700 (PDT)
In-Reply-To: <CAJTo0Lb708rnUEEUf9w0B2er_Ttb890niQUjRdBTTD952BcogQ@mail.gmail.com>
References: <53C3A130.4000900@pabigot.com> <53DC39DE.5020105@pabigot.com>
	<CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
	<CAJTo0LaQh=cMsbVYgt_xjhXqe0L76KC-efk17Pju6A21Da=j0Q@mail.gmail.com>
	<CAMKF1sqZZaXy9AkRHEeXyeoMWABWMS-+PK_v-6QAr5d8Qc1hPA@mail.gmail.com>
	<CAMKF1spYXbaKdjQhAYM3SEL8RjqfTeOwmXpsOXNOS0YaXZJzLg@mail.gmail.com>
	<CAJTo0Lb708rnUEEUf9w0B2er_Ttb890niQUjRdBTTD952BcogQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Sep 2014 08:32:55 -0700
Message-ID: <CAMKF1srf7AFaYXUzwObkAwxO8_P7v-5e5UdcBYCpqXAp0VN7HA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: patchwork client problems
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
X-List-Received-Date: Sat, 06 Sep 2014 15:33:32 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Sep 6, 2014 at 6:32 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Thanks Khem, much appreciated.
>
> Presumably the hooks to auto-mark merged patches haven't been
> activated because the git server and the patchwork server are on
> different machines. Has there been previous discussion to get this
> resolved?

it has been activated and was working in past. Do you see it not happening now ?

