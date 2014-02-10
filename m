Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 816986E7AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 11:25:48 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id c9so10171025qcz.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 03:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=y3NIAU3hyt/VWyKa5syy0Z23xSKLXXO0T+rv397tSrM=;
	b=DkyHRHzB5Tj82WfjPA3NAuP8hUQNH6pJMMhFQQqDA4tBNMpwFjH1Mm+17philtTrM0
	fdP6lrV+Z85irruHPWkWL4OPN8ozkMK2fGq3pJkums9uAjBaBIzre70Ki+OWbVgL6JgE
	FPqNr9ozPTnPBjzWy0acrCZOMPw3at/R6KhqxN8LHw1rbvH9UbOAGTvNOOUVP0Nm7z2H
	3uwgbIhAXyi1xW1XLuTs/Xut3ykJ/rM0hWTxaj9H/6EtVmWA+AiVWknJRKwTvwmYhUfa
	mdaYLALc/YpDdtxuCCyHO02ocMxWx5eW53+Z/1sV+wxryoNYrHQkawzUJZ/WbBcRu2aH
	jhHg==
X-Gm-Message-State: ALoCoQkQdgCp+y1AdD9OCuObOVCibMl4at72ALBRTKTc8R+SOyb/Wa18AL/R/EfQiA1z6UGpm5oo
X-Received: by 10.224.89.4 with SMTP id c4mr46771005qam.64.1392031548738; Mon,
	10 Feb 2014 03:25:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Mon, 10 Feb 2014 03:25:28 -0800 (PST)
In-Reply-To: <CAOMwXhPDaK9NMx7z5Mgady7d4t1AA7dJVikC9w72r_EC3xbqgQ@mail.gmail.com>
References: <CAOMwXhPDaK9NMx7z5Mgady7d4t1AA7dJVikC9w72r_EC3xbqgQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Feb 2014 11:25:28 +0000
Message-ID: <CAJTo0LYdRhvcnU+22Jb-gwX1OXLpA3pw4cdwYeyWSvKavDqaFg@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Patch workflow [was: meta/recipes-core/base-passwd/base-passwd/noshadow.patch: Split it into two parts]
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
X-List-Received-Date: Mon, 10 Feb 2014 11:25:49 -0000
Content-Type: text/plain; charset=UTF-8

On 8 February 2014 21:56, Laszlo Papp <lpapp@kde.org> wrote:
> OK, can you please elaborate about the drawback of e.g. Gerrit?

This was discussed in July:

https://www.yoctoproject.org/irc/%23yocto.2013-07-12.log.html

Nothing has changed since then.

Ross

