Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 15F2765CA0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 16:14:05 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id va2so4408937obc.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 09:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mrUiE8JP7HuDZiWK3HMlUByNuCo2hkgnERuzQnAi+Y4=;
	b=aU7noxxCvnA+hatL5Z0yjxFARXbK1ulrxsSzmDaoUmMK3Dmx1iSqt9QOVpJksksEUn
	gYL3l+cnJdaHwM8AE4ksp5mJn7s5ECgvbw2oA2kuQGKfBpe1iB+OM4tr6Co7INWrq7Du
	0R3RR18vcDRozJuIaMVfvYzjn6K5aSqsj6wFH9A2CyjL3Kfv4P+ilSXQmkx38lMSiXv2
	mIL52Y+GM8/Y2JufK+Cq5ewdp+WTgGeewl6s/A+fKw1o1fCWmy8jz3h8O4tIbfJOODQY
	kLkrMD+UR8X+ELrDBq6jwAXx+a/YdMaSlxpfNpR7ZkCah7iamZKNK5bz47+4pqSkFQ24
	5plA==
MIME-Version: 1.0
X-Received: by 10.60.67.165 with SMTP id o5mr15380284oet.24.1414685646187;
	Thu, 30 Oct 2014 09:14:06 -0700 (PDT)
Received: by 10.202.67.84 with HTTP; Thu, 30 Oct 2014 09:14:06 -0700 (PDT)
In-Reply-To: <54525BA9.9000606@mlbassoc.com>
References: <1414508747-4688-1-git-send-email-gary@mlbassoc.com>
	<CAJTo0LaLRhRASrwdHQboWYjbsGzBmCZgq4J1Qv_i5KDo17ZhVQ@mail.gmail.com>
	<CALbNGRTQQTza3PftOobxDqMvJUGwsGKRAcRX49CXtzUeTOcSzQ@mail.gmail.com>
	<54525BA9.9000606@mlbassoc.com>
Date: Thu, 30 Oct 2014 17:14:06 +0100
Message-ID: <CALbNGRTdXwm4dSwLhoOPjb-B6hqfYZHcorUX1p3LqSUWu9U19A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-pygtk: Restore pkg-config file
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
X-List-Received-Date: Thu, 30 Oct 2014 16:14:14 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 30, 2014 at 4:39 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>
> Wow, since Jan 2013 and no action?
>
> Was this proposed to OE-core (i.e. sent to the list)?
>
No - my expiereineces sending patches to oe-core are not the best.
Usually they just cause me efforts and aren't applied anyway..

Andreas

