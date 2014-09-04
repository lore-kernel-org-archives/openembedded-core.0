Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 92BC97142B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 10:40:16 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id j7so9319639qaq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 03:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kRVoZZ0Y9/OSVZ2fg0RnXa7TWI1W2JeWMB4FhKuqI/w=;
	b=c7F3twMpx/CPOMg4oaEjjDEvjJWOloIazzUReXtoFm+7M1dwkFaHS+4kOlDxEFbo7Y
	QIDQSLY2k6ibB/oDkoWp44GlIX1ewXcAf5G8rBYvIGcd7puMH7MFBcTlZsCZD4s+SZ9q
	ZFks7tnVz0LFnbZzkwTC0uZMswhDN5z+kPi4slWnPPq00pwsHBtwvoV2VZJvBnEVnjAB
	UDMEWYUll0a20V+iMalr8jwiBA0Bx1nfTfikllp9MWwEjsebtP1exbnhWdonig1k5BoC
	1TwnOjkqZNxD7syzqfe5kSyRRg9hUGdjLRyoo9oO3V8h8yt4Umehl+Nw4rMYEXIE8iip
	3A/w==
X-Gm-Message-State: ALoCoQnBZh9/ti2IuMBvKP0MKXHebCHKWmymKxTpgyHln2syGJ4Odab6f78hwR9cX3HzN2K97r2E
X-Received: by 10.224.79.139 with SMTP id p11mr5266712qak.93.1409827217960;
	Thu, 04 Sep 2014 03:40:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 4 Sep 2014 03:39:57 -0700 (PDT)
In-Reply-To: <296b6b0727ada91d72244307146189428b73204b.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
	<296b6b0727ada91d72244307146189428b73204b.1409764769.git.chris_larson@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Sep 2014 11:39:57 +0100
Message-ID: <CAJTo0LYEf5BQ=qdtHmMA1W531Dek1GRMLCBHRAZYznwO5G-VbA@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] setserial: obey LDFLAGS
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
X-List-Received-Date: Thu, 04 Sep 2014 10:40:17 -0000
Content-Type: text/plain; charset=UTF-8

On 3 September 2014 18:27, Christopher Larson <kergoth@gmail.com> wrote:
> +++ b/meta/recipes-bsp/setserial/setserial/ldflags.patch

Missing patch header.

Ross

