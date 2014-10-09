Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1833865D58
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 13:24:46 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z107so1903265qgd.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Oct 2014 06:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LplxpDJV6J526WsXfvPoTAIicmhXrcvv9DcjWGtzSh4=;
	b=dslMHfUphO69igRYHLH3F79iKhXDFkO7AikH4u83pFNSpXGLzBFYAMDGnojgPxuYho
	K3Qk6cNQIDTjTPMP+nazmlcMyO7F70wzBVffMAFuF5xEwegaHzcX8pthFCycc5iNRDx9
	TNBhY+heMROGUzj+DcMKCfqXr6IWZfeBs2hcXH/mlIw2xyNiPfSEnswwQO8LgGA94TvO
	CKvEbQcCntIMJJBf5w5dGFrqrkvpSIaf5eb3bFCYdAEJmubV0N++GU89T2ahGG5zkJ+4
	ymA5U5xH8pjzoKU63mb/a+eRJ4uCG3wfAmQB+3P85GKmwaD5/VL99GgK3ucrmGNIL0fc
	2FOg==
X-Gm-Message-State: ALoCoQm/8Uv3T4LPC1volYa6uoXspdEOIFKg/T8UuKv7lC+LVSIG5s7BOev2aBxcCd2jYstTv6PN
X-Received: by 10.140.23.50 with SMTP id 47mr54806364qgo.77.1412861086611;
	Thu, 09 Oct 2014 06:24:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.106.134 with HTTP; Thu, 9 Oct 2014 06:24:26 -0700 (PDT)
In-Reply-To: <365E1805BC95084CBE82381A0B869994E7529E67@EU-MBX-01.mgc.mentorg.com>
References: <1412093023-3589-1-git-send-email-noor_ahsan@mentor.com>
	<365E1805BC95084CBE82381A0B869994E7529E67@EU-MBX-01.mgc.mentorg.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Oct 2014 14:24:26 +0100
Message-ID: <CAJTo0LZUt+K09oxQLdnhrNtJbChFE95noNKgYsuTsQ9Nwk0=Bw@mail.gmail.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] latencytop: Creates x11 PACKAGECONFIG.
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
X-List-Received-Date: Thu, 09 Oct 2014 13:24:47 -0000
Content-Type: text/plain; charset=UTF-8

On 9 October 2014 09:15, Ahsan, Noor <Noor_Ahsan@mentor.com> wrote:
> Any update on this patch?

It's in MUT, and should be merged soon.

Ross

