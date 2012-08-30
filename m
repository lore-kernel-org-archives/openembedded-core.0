Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T75Xy-0004Sg-Ig
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 16:16:38 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 30 Aug 2012 07:04:21 -0700
Received: by obblz20 with SMTP id lz20so3343289obb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 07:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=TfBMvQae26/cBCgZ1Wd/GrucRhG/VCAPmIyGVuk7P60=;
	b=YNwG9kevXYVSKhltxGEvrZ+qNsvz5tjsVhbn8yjxrzMH9g+HcS0HLtqFSoc40bmA6l
	gU29T8Rj+73BrbaWrFmrAQ/cfphTpxwFz99aYC8L/PLSLBL86+86fZWF4N9lbDROAGJr
	G+DpQ+1PGKtL2MkcNa9L7tHYEeTzpxubAWeUzkMSnojMRf7lEWH53f/ggdUb6U1yWwWn
	USIZPAznrqFsms5A0z8Tp5Aj2sGqqTGy6SQHZ5CY2p+/fdsU4TOxzZqDwyndpDD8TIUT
	QcwsMa0Jb1G1g3MZ+qLL4pga5HEF0J7sTObd6GkVU794DyAGqI7RqzydADNTEQzCvKcM
	YIPA==
Received: by 10.60.19.132 with SMTP id f4mr4607889oee.17.1346335461221; Thu,
	30 Aug 2012 07:04:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Thu, 30 Aug 2012 07:04:01 -0700 (PDT)
In-Reply-To: <A9F5B8AC-9CD5-4BE4-B8BB-BE54D5340069@dominion.thruhere.net>
References: <1346255613-13401-1-git-send-email-ross.burton@intel.com>
	<92175252-0A9C-401F-87F5-751E4CFB8611@dominion.thruhere.net>
	<CAJTo0LY5=R5=7BGtt3LkstRhRb2Ycd1oDJFDoKygtc8KcC4W8w@mail.gmail.com>
	<F37371D0-84A6-4E9C-9455-72409B92E29C@dominion.thruhere.net>
	<CAJTo0LZtnp+CRBrz2GcMsGuGRYzDkCgS46hxGe34v_p47BeMRQ@mail.gmail.com>
	<A9F5B8AC-9CD5-4BE4-B8BB-BE54D5340069@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Aug 2012 15:04:01 +0100
Message-ID: <CAJTo0LaimcQO6umbsMO2YpKSCMKWnhkR+t5EO-nMgtZK3=PU9g@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlkD3nqUcr5rviSBfwAo0LIJ3kqt8SfVTti4IoV8G9zuZ3Xyrr1/Eb3/gU1uNA6CUSlgvoW
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] xserver-xorg: ship the exa module in a separate package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 14:16:38 -0000
Content-Type: text/plain; charset=UTF-8

On 30 August 2012 14:12, Koen Kooi <koen@dominion.thruhere.net> wrote:
> I'm biased of course, but this is what I use: http://beagleboardtoys.com/products/#LCD7 in combination with a beaglebone. Meta-ti has the needed drivers for it.

I presume the same applies for the ULCD7 for the -xM?

Ross


