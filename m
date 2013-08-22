Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f42.google.com (mail-vb0-f42.google.com
	[209.85.212.42])
	by mail.openembedded.org (Postfix) with ESMTP id F21BE6B25D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 19:02:58 +0000 (UTC)
Received: by mail-vb0-f42.google.com with SMTP id e12so1620583vbg.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 12:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=t8tE/eZTNggg049+1nJnSeq3iycNdtZkKEdnNllUbJw=;
	b=U3UbsleVfNTDcFv9naZ6RjVKMdCMi6a+bCitYWSpc/AnsbOM+mmkEtTOE5bSh+BThj
	8U3JnpHcRgfUtYSNbS1uNEpJ8mF3Z/ZWQT6ALhBd1bJp/UdZ64IKhMcja8GwUCxGNHzi
	lFQWl+VEWm0wgymzFxcIo6IU8CmmpkS0yj4SaYrZoj1AlkezYlyunVdqkkSbpZ2KFAt6
	/ORiPsQX6rjhEp+SSuvut/thrKadDUO9u7jI21PDaW7IlxkFtv38ytBzaKS1odLcQZGn
	moh0ux239FDxGK6jR/6J6v1FOhGEyv8zr7AX4+Mzwq1ds3BNo0KGn9rz2XIUQg+wDIEX
	4pQw==
X-Gm-Message-State: ALoCoQmF1De+vl9PhaAG9WiVUSpvy+F0ynURf/DXvoIKMD71pfH5uTZF5YBCp/rQ5H8vas4umRl5
X-Received: by 10.58.97.138 with SMTP id ea10mr72246veb.38.1377198179548; Thu,
	22 Aug 2013 12:02:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 22 Aug 2013 12:02:39 -0700 (PDT)
In-Reply-To: <20130822194905.5687000e@e6520eb>
References: <1373354955-16500-1-git-send-email-eric@eukrea.com>
	<1373354955-16500-3-git-send-email-eric@eukrea.com>
	<CAJTo0La3zAhojZD6sSW=GXRuU+s4KCQQQjBYHTsT3=kFebPPYw@mail.gmail.com>
	<20130822194905.5687000e@e6520eb>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Aug 2013 20:02:39 +0100
Message-ID: <CAJTo0LbgRmJUhF_529EPXfcwofc=57SHGvZZ61n=kcTozsYQnQ@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [danny][PATCH 3/3] binutils: fix build with recent texinfo (5.1)
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
X-List-Received-Date: Thu, 22 Aug 2013 19:03:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22 August 2013 18:49, Eric B=C3=A9nard <eric@eukrea.com> wrote:
>> Sorry for the delay, this series is now in ross/danny-next.
>>
> when do you think these patches could reach oe-core's danny branch ?

Consider this ball well and truly dropped.

I'm literally packing now for a week away but I've just pinged Richard
about the outstanding commits, so there may be a merge shortly. If
not, I'll follow up when I return (1st September).

Ross

