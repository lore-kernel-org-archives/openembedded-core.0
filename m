Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id E01836CAC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 15:36:19 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id e16so4215934qcx.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 07:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=H2ZRVAUmmDaALhXRUQOSy9wE3UcpF8iX/GUIqbmtx10=;
	b=dDEOwE9mEmqRbVO0c0eNPOXLNJpL9p0faBhmEzfxK56sITz6TpNHcclNv1JPuWJ0Jg
	9TMWqglePmlAR4AynaTC+yr4rFPgiPUKqzfEtrx+uUlqUtWzkfqR4TRHUfm9X23grSnw
	QdoAP6bpmR/iib/ItrOFKnl0roS9BxLhamcK9PIQbFR8hCt/ZQlaX8i1MKM/9fupQiSz
	++goU3XlKu2fsXPM1tBEF840ioUYz3/lHqTB+jjm8uZYuFaSwQHfbw8S9I0xjR1I5im6
	WcSccz/obVAfvAIV3wM9K3ujQtZdgE9KBS0ISeK+sDYjnwNeNAjZudK3/jzlC2luk869
	vpyQ==
X-Gm-Message-State: ALoCoQkPcNtYweH8S/z94t4u4g1BDwqHm6TFCandquf3pn9Oy5BeWAQJNKY1Ni6w6KoZq17BzUbX
X-Received: by 10.49.127.205 with SMTP id ni13mr41186362qeb.40.1389627380730; 
	Mon, 13 Jan 2014 07:36:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Mon, 13 Jan 2014 07:36:00 -0800 (PST)
In-Reply-To: <52D07F3C.40601@linux.intel.com>
References: <1389373329-21241-1-git-send-email-ross.burton@intel.com>
	<1389373329-21241-2-git-send-email-ross.burton@intel.com>
	<52D07F3C.40601@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Jan 2014 15:36:00 +0000
Message-ID: <CAJTo0LZukTaA9W1PevpND7E5U20=Shfu2fV-m36M+Ey2P9-Y7A@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2 2/5] python-mako: add (from meta-oe)
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
X-List-Received-Date: Mon, 13 Jan 2014 15:36:20 -0000
Content-Type: text/plain; charset=UTF-8

On 10 January 2014 23:16, Saul Wold <sgw@linux.intel.com> wrote:
> Seems like they might have moved or lost these files since you tested, the
> upstream is at 0.9.1 and has moved these files to
> https://pypi.python.org/packages/source/M/Mako/Mako-0.7.2.tar.gz

Yep, V2 incoming.

Ross

