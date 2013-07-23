Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f42.google.com (mail-vb0-f42.google.com
	[209.85.212.42])
	by mail.openembedded.org (Postfix) with ESMTP id BA4A26B1B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 11:14:27 +0000 (UTC)
Received: by mail-vb0-f42.google.com with SMTP id i3so5469299vbh.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 04:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=KMwaWpG3h49NtK6/zH2wcOlbns8sh98taeHn2/n1XB0=;
	b=YBIwxcy4ZSTswTqgwB7tc955ItBRSAagPH46HzEktUvKcJNIIGZPErvnzsl9fjxk67
	Mv7AlN1svq/nLQm5DQUsLT4DMXXwif+aWRhXkZkG+mXMVfm65UMDwRHS/1vabjU4qgwn
	Wef3L8BQj513Oa5ipj8tv2HUDVpIDyjJNCRmmDQDjZe9HY5oq04Gzk5dDaBPUIxrA6dB
	dOsL+uWu1lJwrQrTs24gGudcap9PPVemxdfYvLQGx3bmHy2AhpkvcKSDg7Y7YGX4OXBQ
	cZI7EvkkTy2V1JUwZtA4YVJ9gHzd+6xq8A1+Csiz1sES0RQj3GwD+531iANwSDXKo1eZ
	kQkw==
X-Received: by 10.58.76.130 with SMTP id k2mr10866873vew.24.1374578067791;
	Tue, 23 Jul 2013 04:14:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Tue, 23 Jul 2013 04:14:07 -0700 (PDT)
In-Reply-To: <1374502085-16914-1-git-send-email-cristian.iorga@intel.com>
References: <1374502085-16914-1-git-send-email-cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jul 2013 12:14:07 +0100
Message-ID: <CAJTo0LaP8syHY_LMCcdFopi61T0XT7xZ_oUa6EO+VqNdHnD0TQ@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQlGsWy0KCv0uLRPksi4UM/mu+P4Oax8q/sG8qSoM0BDrksQSVx5QZd35GdmAcGrtVAshLVh
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: upgrade to v1.16
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
X-List-Received-Date: Tue, 23 Jul 2013 11:14:28 -0000
Content-Type: text/plain; charset=UTF-8

On 22 July 2013 15:08, Cristian Iorga <cristian.iorga@intel.com> wrote:
> inet-fix-ip-cleanup-functions.patch no longer nedded;
> included in upstream.
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>

In what BSPs was this tested in?

Ross

