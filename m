Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id E45F174A0D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 16:06:04 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id q72-v6so639000itc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 09:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PqFXLrTH1nAWen9BWlPAVOCimXPlzCu71s45YzatpvA=;
	b=BiBl2gpIpNU4QW0eGbDQS3iKchssLcGyS3MsbmBiSBo25N/phCJia9y7fpEUs7kE9e
	UVh3vl43JZ7huAogC/85l14lH8EUh0d4YNSTVAnJGR+nxlvdMFbwWkDRDiYKp+y8LFLs
	Ls+lJtcqVjTkVQLMH4zP+J017YyZBxD/dr/6q7vvDcPXDmFB+tNxkoaRirON31DavfiE
	k1fv1zgHLaoIcYuCy7kV4eca3Y5Xh0CLzS91dcrKvLIb1Ko+oUcwxTd70+YhT2aVsnAV
	HG3GrbWSFx2VkWLFzYYgJrtZgfewBEfV/BWZT860r4dA7WlP0qt03ILIvrVFawBKtcHJ
	IE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PqFXLrTH1nAWen9BWlPAVOCimXPlzCu71s45YzatpvA=;
	b=Olhb6Lb+XmhqL8R/ha5Sm2I9Q9PZj5H47rL1l8OOGasPIlyQ/AEy1yvGyyrZuUO/gh
	fQwb2VDYEEYLrViiSc2ZlItOWO6earGrJIl6o0yUC118HaYFQnRWNgIEm9YSHGg5olb2
	xT5Qz6ZntGCsXRE3Qx6yP841lrYlcnWG1Ct1VJuzL1njAZWv1wdrmHb6OuSk8d/sAZfZ
	v8GexUjp43QWlHIdandrckHGaHyWNw6aB45n0W6ByUQvzhNmoCrdwqTLaqRV7BdVR8PU
	En5Stug1rnTdNmQELWneaG+XZ5MbXnD5BDzB3hEHONEePwmKGPbRmHbeV358vjHj7/6A
	U0oA==
X-Gm-Message-State: ALKqPwfoIFDGWqgjQzQxoOjMTTcQCZrrvy98GIj+l3JHenQEcjtcvf9I
	Z/OEwfnpoBUCmPhR8i5ZdLhUjLsebq/V1Pqil6P12A==
X-Google-Smtp-Source: AB8JxZoIuIM/QPgUgjooMEzSxduWZ3avIO75cxX7ekBBd/b3xfPaEwLEpjM8Rg2xaQpWkLac+16ifQcIhfCId3dz5xk=
X-Received: by 2002:a24:496:: with SMTP id
	144-v6mr1809416itb.131.1527005165757; 
	Tue, 22 May 2018 09:06:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Tue, 22 May 2018 09:05:45 -0700 (PDT)
In-Reply-To: <fc0d7e3b-9d0c-7ea3-1caf-ad3099f40099@gmail.com>
References: <fc0d7e3b-9d0c-7ea3-1caf-ad3099f40099@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 May 2018 17:05:45 +0100
Message-ID: <CAJTo0LZhf6nXfT_O6kfZfO8hkfZQz7dJVek0nF93G0fu+L6QKw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-openembedded maintainer ship change.
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
X-List-Received-Date: Tue, 22 May 2018 16:06:05 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Armin for all your hard work!

Ross

On 22 May 2018 at 16:40, akuster808 <akuster808@gmail.com> wrote:
> Hello all,
>
> After much thought, I have decided to step away from being the
> meta-openembedded maintainer, patch wrangler and builder.  Khem Raj has
> kindly stepped up to continue these activities. Maintaining this was
> consuming too much of my free time and I need to focus on other things
> in the community.
>
> Thanks for the opportunity to have served you.
>
> Kind regards,
>
> Armin
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

