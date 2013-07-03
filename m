Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF4761485
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 15:22:42 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id jw11so237265veb.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2013 08:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=KjUxFEB9oNRRCfs5HF+EPfRaI4zo4JhTzTDp7p5/Ujw=;
	b=JZZtoSyOReQUDJKNRslkDUg10+OLNKLzE2xKN+oyqDGoGCwY206Sdz2s6yZ8M3Zg4s
	mphPBlZ6HBm0f57Ffv94qv2F6ehCHbl3PGF4ZigGAKoELXvWNK357evf9mU/wJe1qqSz
	fE6IlPaxfqz0o/v913Aj5qJP8/TuGY6i2sM6eV7WTPfxxV0NWjUQvEFjoUJxIR9/zjGx
	z8aKUsz++dPCIxGM50LEYWlsxzudh1EzsZZ2Yz5JvR8fbZLlxSAqjMK8KiMpVzyVPCZZ
	0ebC7Ui0NIvPENjkAyyqxKt4203Enn2LhRcSdCf14vwI/PVpPCepGUTjdbYPRGa7ZfBV
	UIuA==
X-Received: by 10.52.164.227 with SMTP id yt3mr339053vdb.107.1372864962878;
	Wed, 03 Jul 2013 08:22:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Wed, 3 Jul 2013 08:22:22 -0700 (PDT)
In-Reply-To: <1372831460-6435-2-git-send-email-net147@gmail.com>
References: <1372831460-6435-1-git-send-email-net147@gmail.com>
	<1372831460-6435-2-git-send-email-net147@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Jul 2013 16:22:22 +0100
Message-ID: <CAJTo0LZ-B1kr4GLp_gJkJOcX23ua+LAq7KrW+sTdbz-r2eb3fw@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQn2r0QilIj9m61pV2NekP/wXZSdEY3MD9kfTjvX38/1LMfyfeIBgDYlCEoRd1WQeIBTFWeR
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] xf86-video-modesetting: upgrade to 0.8.0
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
X-List-Received-Date: Wed, 03 Jul 2013 15:22:43 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

In the future, please use -M so that the diff is clearer than delete/add.

Ross

