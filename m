Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f41.google.com (mail-vb0-f41.google.com
	[209.85.212.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0221D6B5B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 11:15:17 +0000 (UTC)
Received: by mail-vb0-f41.google.com with SMTP id g17so164307vbg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 04:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HIymlwbQ2FWxuFor+neI8aSCDSWpBl4YwTpdsX/626c=;
	b=aOwEEuSwmL1ykjByevNa53VUgJsjVhCQaI66ZKoNz+mbdL07MhVbjVEiXGiAEqNwEM
	ao3ZKjsgSCoImfMJokAjvWb8GqXWrNrqJB8jDlx6sTPyucqIm9RnksVGwvhWZfAIL1E/
	iT2G3DLl+Z9zVIsXko0mPzlvx3JwKEuxBjY9X6rCGv8LU0uxLimaIS1fCqTkpVCW+UKb
	YFaVzZwROKvxf5xMRF1Fjt8gTY8NRH2FvVLHTrDGYQOuBUaGYHwdv4YP/cDthXCBy+KM
	e6AEQ2wM8mmTaK6vsacjdQrXCF9mpskt+CK++RRR8jj4o7uVqiwh2qAocvHfG6XyX08s
	yUsg==
X-Gm-Message-State: ALoCoQlPPCDpoGCanv2q3xA/Gv68lcGMoLLnL5BwphRyq0kP/H87Y6AAtVzU/o5ywgTIRPW5TpuS
X-Received: by 10.221.64.17 with SMTP id xg17mr743549vcb.5.1376997318617; Tue,
	20 Aug 2013 04:15:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 20 Aug 2013 04:14:58 -0700 (PDT)
In-Reply-To: <CAF6bG8dSZZaLiZKVpafKFXSQnYb78Mn7baWQFnjmWvwMYHs0pA@mail.gmail.com>
References: <cover.1376988152.git.cazfi74@gmail.com>
	<CAJTo0LbUg8e_pQ+zFHa2bGjChUQpWhmiSqEfwq+KneG7KtmP-g@mail.gmail.com>
	<CAF6bG8dSZZaLiZKVpafKFXSQnYb78Mn7baWQFnjmWvwMYHs0pA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Aug 2013 12:14:58 +0100
Message-ID: <CAJTo0LZbwmxZDQqX9WvMHRgJxBLFgSu5PR8sFuVW7hRqRqydeg@mail.gmail.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Automake-1.13 fixes
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
X-List-Received-Date: Tue, 20 Aug 2013 11:15:18 -0000
Content-Type: text/plain; charset=UTF-8

>> Are you deliberately just sending the cover letter, or is my mailer
>> being strange?
>
>  I've sent cover letter only.

For review purposes I much prefer patches in mails, can you send the
full series?

Ross

