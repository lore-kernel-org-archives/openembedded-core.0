Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8256B703CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 19:37:42 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id c9so67677qcz.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 12:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UFBC9HW+h8zfBdVDTmDZ96nAFRTgI7tNWZVeP4XHMt4=;
	b=WOKIC2+RlPaZWn9g7IGyklRWQ3wU0NFZXFx2w7wEbNOiVjk2wC1bRqFMtS2eOG1eeZ
	6OSP+msYysGDt64V7/1sleaenFJQGS0+QxTSHCKMPr64/qqEx/KbXFnZsgY2Y1ebcBiQ
	kiXuzxx+C9aaXmKKEa5WGwpErANKXVQWfk25uhhqtfE2enxQbwBFD5ByUdLOl6Ccna7j
	Z9sHs6EBdqIwBUtmJfvBPUXlWhiTNlCHK26+S0N7upbdw8JN89HTVr6Rc7scDS5EOFGN
	f3Ep5ZJHCd7kYTCMcm6LUOnClhQ+qknOIfy8+2BMSO8ZQBJrd300EkyulL2pIGidmjK7
	FL1A==
X-Gm-Message-State: ALoCoQmjJ+3E4dmpgxHhKHXl91B3R49nYbOOYv3siZltOXJxKTZcA2GGBIgGl7tJGB5tQt8hSwN9
X-Received: by 10.224.120.68 with SMTP id c4mr46733225qar.17.1405021063846;
	Thu, 10 Jul 2014 12:37:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Thu, 10 Jul 2014 12:37:23 -0700 (PDT)
In-Reply-To: <1405013524-11228-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1405013524-11228-1-git-send-email-nicolas.dechesne@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Jul 2014 20:37:23 +0100
Message-ID: <CAJTo0LagVOxUCNT1P+=6yBXydb0tP6SuADyy6CAb4jgX=YU1Eg@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] git: update to v2.0.1
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
X-List-Received-Date: Thu, 10 Jul 2014 19:37:45 -0000
Content-Type: text/plain; charset=UTF-8

On 10 July 2014 18:32, Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
> Also fetch source code from kernel.org. As per the Git release announcement, see
> [1], Git source tarball are now located back on kernel.org, at [2].

Were there any big changes in 2.0 that we should be aware of, or was
that just an arbitrary version bump?

Ross

