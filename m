Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id BA68565E31
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Apr 2014 17:27:31 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id c9so3031884qcz.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Apr 2014 10:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jy6SaS2Jn8iy4akRJpfdaHQwDh5iuB0yNc5Drpf9ieg=;
	b=SsLV4cD2JQLzkqC1jR3ttR//eSX1twfLMCYPGniL2dV/vjdMQVztWHZI7JaAjK9xoL
	w14TeJp32lofwYdRPRm760WBs51rqT/vubS2OKlI7vq6Bk3B76GCyRwJqMqI3dSv3nUf
	YUrGDIeGc6S3AoGS71l8BXtLyFt9Q3R+jHIzzCRA83qQBZTmzCPNvFlAKZ7lAxDwzIL8
	9m7tLnguMA5cCEV1BYXE2/Qjwgw3X32OSxi24F25B2WxY9HFaYzpRG2my6aXvTaYrsBO
	qbQL8u8TKvZwX7iFTjDEJUPyRpxfDwXhKiM/TZAvKAGrkrdE9ShLDnQwMMMJvIuWBp2w
	BGlA==
X-Gm-Message-State: ALoCoQkx7UTFnAETdg1rCpGlw9MrYoh8RSpTExRsSBgsAVD6d/FVhqwV1xaEG5s6sSmrBsIwnP71
X-Received: by 10.224.147.77 with SMTP id k13mr14457382qav.64.1397064452065;
	Wed, 09 Apr 2014 10:27:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Wed, 9 Apr 2014 10:27:12 -0700 (PDT)
In-Reply-To: <53457C1D.3000200@linaro.org>
References: <1397059003-9413-1-git-send-email-trevor.woerner@linaro.org>
	<CAJTo0LYsWzZ3-GDLCSVM7pQmVpvCA2T1PhsE92E=TAdJgTbqjg@mail.gmail.com>
	<53457C1D.3000200@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Apr 2014 18:27:12 +0100
Message-ID: <CAJTo0LYvLg9rV3d=xp5wmjp5vPy5BXkpBskjJX3_Pg7OMPAftg@mail.gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] common-licenses: add The Open Group Public License
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
X-List-Received-Date: Wed, 09 Apr 2014 17:27:33 -0000
Content-Type: text/plain; charset=UTF-8

On 9 April 2014 17:58, Trevor Woerner <trevor.woerner@linaro.org> wrote:
> On 04/09/14 12:24, Burton, Ross wrote:
>> Please don't say the next patch is adding Motif to oe-core! :) Ross
>
> haha! A little too late for April 1st, eh?
>
> I'm still working through a world build of (mostly) meta-openembedded
> and motif is there. Is there a better place to add common license files?

Surely a meta-oe specific license could go into meta-oe?

Ross

