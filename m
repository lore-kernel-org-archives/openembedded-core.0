Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id D72BD6D571
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 19:18:57 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id ld13so625280vcb.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 11:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=U4WqAw+C9vkil6jnHNUh95kg0CQTyB/heT25FxmqtkQ=;
	b=a09Nz7zjfw/ICWa6vjc1OCEm0mP4WPhOJaGT6Xrsy+cLTDxm/KbbgNyACbTMD7vBHX
	AaISGjRWtIbfLoxLs8LXvVeu4PFFRLmyEpWgoq5GdSjcRCDjylYTstJyR19nkJ5Tpxo3
	s9CHPXNbT/JFGWLPqjHRBEcwkQ4pNk2kBDI49o1RA7n586RB4vu+NAP6YUesiTzZ1nXX
	ZCM3NZw6EdwethOkypNvD/zCEPryDomKXWkP+Wvd49Ub3gnBFcWm9mRYSLTqNE+78Ihd
	yuuV2LaaYrG8M2P1tZ6YC+KvErJFll1ACCHCkFdPxsrrso5ghhXvRAkaxQP5bdreT4CP
	9yPg==
X-Gm-Message-State: ALoCoQnbXcZDkqzUkBczFoCcTUijogRssfnybsAGjLKuENheyPIBfM288eYjxFgUch51pxbPGc1W
X-Received: by 10.52.160.35 with SMTP id xh3mr5234vdb.112.1384370339019; Wed,
	13 Nov 2013 11:18:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 13 Nov 2013 11:18:38 -0800 (PST)
In-Reply-To: <1384365634.17320.49.camel@phil-desktop.brightsign>
References: <1384354266-15425-1-git-send-email-kirgene@gmail.com>
	<1384365634.17320.49.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Nov 2013 19:18:38 +0000
Message-ID: <CAJTo0LaXpAAG+nfZYsSr_PT=-tAQ9RLWW=yGYNPnnktRwbvMkQ@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] curl: allow build with c-ares library support.
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
X-List-Received-Date: Wed, 13 Nov 2013 19:18:58 -0000
Content-Type: text/plain; charset=UTF-8

On 13 November 2013 18:00, Phil Blundell <pb@pbcl.net> wrote:
> OpenedHand Ltd was apparently dissolved two years ago so I guess its
> copyright notices are just historical artifacts.

FWIW, as of October 2008 anything that was (C) OpenedHand Ltd is (C) Intel Corp.

Ross

