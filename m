Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id E0B69703A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 07:45:01 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id v10so585647qac.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 00:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=wPW1VKchKRem7IKsawiBQ9iVYeNp67PK+6O7MMOEh4E=;
	b=aLzogWa71z4NeJ6uAHMsAPlLZbBcSjeiBg5Ed35DKGth1w4q+AYIs4ST/G6lHX4Bar
	nedXrNZEvaFCy5CSA34eDgue0YZARtEneRVg5zlI94l0+9s6NysC/GVPNSM2iqHOx7VS
	CNyMKWxosHjFCOaC7H7XlsQRG4CV4UN4LRucm8A727gYWvXV+8r8x0ZmD1DpZ+WsddOo
	a/TDD/IqrqzZpfdHp5F7hwQhj5SBNaYmZV433zVAIW19o7VJlGCJNI3KapCNWM043lNg
	79KV4ElFH0u/QBUBSSuDPC9EASoaFUK7MnWcjfjyrYIaU+nlGXX5fMcKfyTbuOg7eH4+
	lAYA==
X-Gm-Message-State: ALoCoQlDQ2RweBoqbCmZ1nZGdxAwFQKVkCwUqkAsOu3I3NxlQunL5zO8UZT3j4n5oUQCEdCKD/uh
X-Received: by 10.224.25.206 with SMTP id a14mr74901359qac.35.1405064702663;
	Fri, 11 Jul 2014 00:45:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Fri, 11 Jul 2014 00:44:42 -0700 (PDT)
In-Reply-To: <20140711073413.GA9641@ad.chargestorm.se>
References: <cover.1404987090.git.jackie.huang@windriver.com>
	<20140711073413.GA9641@ad.chargestorm.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Jul 2014 08:44:42 +0100
Message-ID: <CAJTo0LbC0F+h2pV-K+0DUYAvDbdzM==SAwbk9_FOPCKS9K98OQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] postfix: add new recipe
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
X-List-Received-Date: Fri, 11 Jul 2014 07:45:03 -0000
Content-Type: text/plain; charset=UTF-8

On 11 July 2014 08:34, Anders Darander <anders@chargestorm.se> wrote:
> I think meta-oe is a better place for postfix. So, please resend it to
> meta-oe.

Agreed.

Ross

