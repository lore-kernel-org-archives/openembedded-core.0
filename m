Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 47AE0601A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 16:30:20 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gl10so13281622lab.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 09:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=c0KYx09y+CN121dMTznjBcmtrQno+EBba7LDXbqQc8Q=;
	b=LyZly8KZ7fSEqqGY1ezXD9uNHm8C1rydnt9TRA31S3th0Dw6K4xKj7FqZt3gjprbtv
	Cz17gqZcbrp4pti7hVhDDqoYio73xSyjNIaz+DSt1ObbeU257UdIEn/5Rvk6+daOPo7v
	rLK8wCcrHZjxhHtMFDXbhZWZdMZ37YnmZBDh2/8/kC0IeEB9Ip3+ZGlQQhx9bc86IeLR
	KhBBg8yoqck2WTF4uQ0FlK5fM/pRAaiv+wLjTuRwWD+USW6OO/TZFmNCB0lQ/NuR9y3r
	38RfraPIK2rpCjI36EBMGV5WgYFYvx9nqT7FfDkjzKpWex6z+W1EXOPPVBXix6TIGZvP
	lkhQ==
X-Received: by 10.152.20.41 with SMTP id k9mr111928lae.57.1408984221052; Mon,
	25 Aug 2014 09:30:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.43.42 with HTTP; Mon, 25 Aug 2014 09:30:00 -0700 (PDT)
In-Reply-To: <1408983725-45864-1-git-send-email-fahad_usman@mentor.com>
References: <1408983725-45864-1-git-send-email-fahad_usman@mentor.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 25 Aug 2014 09:30:00 -0700
Message-ID: <CABcZANn+WjdOJYje5vFO=KgjA9fhkSFHNs1CVso2iEW4Y433xQ@mail.gmail.com>
To: Fahad Usman <fahad_usman@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] logrotate: obey our flags
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
X-List-Received-Date: Mon, 25 Aug 2014 16:30:22 -0000
Content-Type: multipart/alternative; boundary=089e01493e18fd757c050176b326

--089e01493e18fd757c050176b326
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 25, 2014 at 9:22 AM, Fahad Usman <fahad_usman@mentor.com> wrote:

> Needed to quiet GNU_HASH warnings, amd some minor fixes.


Typo, not amd :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01493e18fd757c050176b326
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Mon, Aug 25, 2014 at 9:22 AM, Fahad Usman <span dir="ltr">&lt;<a href="mailto:fahad_usman@mentor.com" target="_blank">fahad_usman@mentor.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Needed to quiet GNU_HASH warnings, amd some minor fixes.</blockquote></div><br></div><div class="gmail_extra">Typo, not amd :)<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--089e01493e18fd757c050176b326--
