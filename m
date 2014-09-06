Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 98D9F71397
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Sep 2014 17:24:18 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id rl12so294822iec.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Sep 2014 10:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=z6UY5QUcR0+lyUKMwZW1gKNUfwNlguWIT6Z6ukTDBxE=;
	b=otBTK7ExW90s3IeabcZDd2GmJpkKCAfHghhKb1uHtgsrwMc3HDraluGB1VLyrXsqEA
	J8LKCqk4B0xC8mL7DCmW4qJ1vVMwXZQOjqfGcQRnptl4Xt0u81inwtbOvoku1Kfar/LZ
	4dGUBQFFCXyX5RiF5+j7jKr1JnT8OGDUfxnqZOBopzNyHL71j/Qt+KmqMFIqXw2MLnwQ
	cZNI8tKPSrASxLRUzfDSftBs1tM8VJl5MKCWemSaTu+jFh5h5Uo9KCO0duz/t5zCUn5F
	i65wP3khyCQXCmrEDBSfmJq9aY976I+zu6HO/xU+zUJwamIrnNwdgD8kAs7F+Xkg28MQ
	6y0w==
X-Received: by 10.42.62.6 with SMTP id w6mr22277419ich.24.1410024258947; Sat,
	06 Sep 2014 10:24:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Sat, 6 Sep 2014 10:23:48 -0700 (PDT)
In-Reply-To: <540B3050.4080900@pabigot.com>
References: <53C3A130.4000900@pabigot.com> <53DC39DE.5020105@pabigot.com>
	<CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
	<CAJTo0LaQh=cMsbVYgt_xjhXqe0L76KC-efk17Pju6A21Da=j0Q@mail.gmail.com>
	<CAMKF1sqZZaXy9AkRHEeXyeoMWABWMS-+PK_v-6QAr5d8Qc1hPA@mail.gmail.com>
	<CAMKF1spYXbaKdjQhAYM3SEL8RjqfTeOwmXpsOXNOS0YaXZJzLg@mail.gmail.com>
	<540AE4E0.3080209@pabigot.com>
	<CAMKF1spvZe+uUBs6z4RX31T+Lax5T5gCbYzBtc=PvYKA5n_KzA@mail.gmail.com>
	<540B3050.4080900@pabigot.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Sep 2014 10:23:48 -0700
Message-ID: <CAMKF1so0R6-5u9hAFdz1gaHHk46nkTMHOzwjqeG46q-0WZKCjQ@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
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
X-List-Received-Date: Sat, 06 Sep 2014 17:24:18 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Sep 6, 2014 at 9:03 AM, Peter A. Bigot <pab@pabigot.com> wrote:
> Apparently not. I don't have an account, and while trying to figure out how
> to request one got to a situation where I get 502 Bad Gateway on every
> request to www.openembedded.org.
>
> The help output from pwclient and the comments in your example (and the ones
> downloaded from each project) cover it pretty well, though.  Just wanted to
> highlight to the current readership that the new version supports multiple
> projects in one config file. (Breaking the way I've been doing it for the
> last couple years which figured out the right default based on context, but
> hey, progress, right?)

OK. I thought you have a improved version of .pwclientrc, just send it
here. I will update the wiki

