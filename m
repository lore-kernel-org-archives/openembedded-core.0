Return-Path: <jefro.net@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 070C160125;
	Fri,  9 Sep 2016 15:55:17 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id w12so39163643wmf.0;
	Fri, 09 Sep 2016 08:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to; bh=B29GG1nsZFOcpqQ3V+petF2qiw36nw8mRVS/sd9b858=;
	b=Kx4bvZEZVZRD9uHUBBmYJBxAG780Oigl2baCp454wjIYImvPBtD9Jt3uupKOPgMIOZ
	c3o9POUvuPq7IBSmIQoI/MNWWdgSNHx7CWDbpD0NZAVJVvDlCfuaedMR52Q/5HiTTc5Z
	5f7IrfkG9XTitipWd+ToRizr5zpxLcXwnqJMeRGD5ZUloQbonEhpgYAdzdTN/IkkDTg1
	SKuhlVbmy0f3jL/vTXy2OlnkDKo2LGh76az5axziHd0tWumdQdaqZrzFiN9hrAW0LXxg
	zOPVTayb4MhcAaUwRKjxZByqhUp+49BztwAMns98g5arWleR5xDIqiduM8k/A1Loikte
	Md4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to;
	bh=B29GG1nsZFOcpqQ3V+petF2qiw36nw8mRVS/sd9b858=;
	b=R8/DtcNFaxvNAGAGUCRko7WzzUXhV5irTHAbZb3Q2IoTUKvsH35u78RCNo9nRObXRW
	gcBK3Gh5iKwCtwRvPzZE+nps4rFvYu5jI6qayne6pV0rzuhtD5kMj0NfcusXuPbTWSOe
	YDL6ssdyaiN0CroPtXd7iJdYggCoQ0gFWqmf9PrQ8NtQCSSchvzgb8X9d5DIFhPImnxT
	deCJxJfCWXlTJDjx7CUbWkHYiXqWR/JlEDIoIE77/4C+zkaLhI8KhBOCjBDh4egya36f
	Djn4kdhgx1l/XqLyc6b/OgBsJhzka8EbG0Fj64XQdEPFHRJV/MmDr/ovzEobYZqvoCsW
	3vtg==
X-Gm-Message-State: AE9vXwMUC7IMgmjwVQhUwNirTkE9GFPzg3UJA7gPu6jMCFKoQ4s55mML90axqvGfm2ltSt2TZ+7OpL6ymHm5jQ==
X-Received: by 10.28.132.131 with SMTP id g125mr3570400wmd.97.1473436517629;
	Fri, 09 Sep 2016 08:55:17 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.80.151.3 with HTTP; Fri, 9 Sep 2016 08:54:57 -0700 (PDT)
In-Reply-To: <CA+YB3raLEFHAECfBVAspQni9fG0_X0oTPM-Z_F64FzV6PuNdUw@mail.gmail.com>
References: <CA+YB3raLEFHAECfBVAspQni9fG0_X0oTPM-Z_F64FzV6PuNdUw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Fri, 9 Sep 2016 08:54:57 -0700
X-Google-Sender-Auth: YqXEYItfk1vrHpu1pZHnGipE-_s
Message-ID: <CA+YB3rZfZ8fQ_s85ZQ5aSWyWbq+jS1DK3paM_RximC6wvxwCAQ@mail.gmail.com>
To: Yocto Project <yocto@yoctoproject.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Subjects for YP Developer Day at ELCE
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
X-List-Received-Date: Fri, 09 Sep 2016 15:55:20 -0000
Content-Type: text/plain; charset=UTF-8

...aaaand HERE's the link
https://www.yoctoproject.org/yocto-project-developer-day-europe-2016

On Fri, Sep 9, 2016 at 8:51 AM, Jeff Osier-Mixon <jefro@jefro.net> wrote:
> Hi all - we are in the planning stages for DevDay at ELCE right now,
> particularly the advanced track. This track changes every session,
> usually to cover the things we are working on hardest - for example,
> in San Diego we covered CROPS, devtool, the latest Toaster features,
> and much more.
>
> Whether you are able to attend DevDay or not, we would be grateful to
> hear your suggestions for subjects to cover in the advanced track. We
> are currently planning talks about CROPS, devtool and the ESDK,
> Toaster, wic, smack, security, and a few other things. If you have a
> burning desire to hear about something specific, please let us know.
>
> Also, we'd love to see you at DevDay, here's the link:
>
> --
> Jeff Osier-Mixon - Open Source Community Engineer, Intel Corporation



-- 
Jeff Osier-Mixon - Open Source Community Engineer, Intel Corporation

