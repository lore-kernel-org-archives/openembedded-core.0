Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id E00E36BF85
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 17:11:43 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id 15so3406364vea.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2013 10:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wOmQPQJmaa5kMXJucOUA7WWiGmVMDopD2QJYaaacCUA=;
	b=I33H4yUurISGT505YIVVyI4k2QWFypOS4l+QAEqSTqfzCQ/P0iIPPnSKvvmd5sCmXb
	MdcQ11IOtwXL6PvGD/FWIu4xZ9RSrNgfzvywmz55OGes7/yZ7FhD/kLDH2+yQlckGfZr
	3RtOKrhEI4103Lhfigoo8XMuiPgLGOGljYJlVPiu1Pk+coQ+x+FIfFQQ7/zL6DPaeHKH
	yzqmBCVMRXdTVAcz2ZKkMtZdIUJUMOBJjodhtk0Xb1A7051GvxBc7EyNLubhIAPnUJpn
	KOHAuwNypLEu84TeYMzyJag5Qf/sxC23E9b8sVoaCUGikpOVEtGvIZVB7qjdL5Yp23N0
	PSyQ==
X-Gm-Message-State: ALoCoQkV0wDN13wnxVu04ZO8iM4ZvNXrP5/+HQYMZ1lR+Pzn8RXEIEDWPX05wRCV8fAW+zyqdR8b
X-Received: by 10.220.11.7 with SMTP id r7mr23875292vcr.12.1378141904627; Mon,
	02 Sep 2013 10:11:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 2 Sep 2013 10:11:24 -0700 (PDT)
In-Reply-To: <75b5f2fe123fe20e0222bf25e4b0c5a1f836b602.1377792006.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<75b5f2fe123fe20e0222bf25e4b0c5a1f836b602.1377792006.git.Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Sep 2013 18:11:24 +0100
Message-ID: <CAJTo0LbQ7zJjdJ+RbSg_wdWTnRZ-NqW_1rNfQwBniKG9sTRikA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH 05/20] xdypinfo: Add dependency on libxcomposite
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
X-List-Received-Date: Mon, 02 Sep 2013 17:11:44 -0000
Content-Type: text/plain; charset=UTF-8

Typo (transposition in recipe name) in short log.

Ross

