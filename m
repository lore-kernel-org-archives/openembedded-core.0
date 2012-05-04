Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQJy1-0000lL-95
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 16:58:45 +0200
Received: by laai10 with SMTP id i10so1371063laa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=M1enC6sNT7rir0gHw0dpUx5ltuDUlHggmERt4ygPTT0=;
	b=banEeFSyRvLSpNTPdDLv55iVwE1Uso/lyJcuNituCqdzFQ6TlR9Nu88zrxn6uinoli
	2xpYzAiKtrGQRTC29aQUvuxpUM0afYTW3dXHfX2ioNN4YCvfef+FbGRPSzWvjzjVSstn
	CIgCou+frqIeikwA7lLeTRUSaEVC8BFo79yyipLbD/MG1lROmxHv+pTJtd+xwZfrMkFa
	59wu4ND0T+0MWzyo81T1cSFHobIBqxL1/xi7Tk07ksvStbi8WrcP3jNsGY3dS4xEfyOx
	D63i1GGzU5vA2AHp+Mt04YNP8VXLNq6usLDpwAPVP8RILQmofPb3ERHzHw8k5nE02LXQ
	ja5A==
Received: by 10.152.133.144 with SMTP id pc16mr3771933lab.0.1336142938393;
	Fri, 04 May 2012 07:48:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 4 May 2012 07:48:28 -0700 (PDT)
In-Reply-To: <1367450.rzi5djsU21@helios>
References: <cover.1335991900.git.raj.khem@gmail.com>
	<CAMKF1so5LJRMx-fJPOasquEheq9Rk8PGPKFkbv4DSWZ=PJnLwQ@mail.gmail.com>
	<CAMKF1sr+uGUpy9hFcak_pY2QbX542XRRfiZAzwbOD_wGXuH6iw@mail.gmail.com>
	<1367450.rzi5djsU21@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 May 2012 07:48:28 -0700
Message-ID: <CAMKF1spAA2mqHvh52YSuDvYYLV73CSXh0HSpcV3h=E0JwWF6ag@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] Enable PARALLEL_MAKE for testing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 May 2012 14:58:45 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 4, 2012 at 1:11 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>
> Could you please also update the commit message? i.e. this is no longer "for
> testing"; details of how you tested it, etc.
>

indeed I should

> Cheers,
>
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre


