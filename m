Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB8665E28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Apr 2014 16:58:16 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id hl10so2664447igb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Apr 2014 09:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=lHURPQJl7EjeggxDpcyFiZEDy4eAUs4p+xU0AbTxxTQ=;
	b=NRsiHubq4evPxH7MVG0fd0qYzSx3bdok0lg+j8cA8w6fCEDCzq6Ft7tzRb3AGobwgq
	4MAEwHJq3J3Edv1DI733WsxGEwt5eoVl670DCGO/oU0COPK+UQdqNxcOM+VSPhdNpnfm
	aIxQeC9boQ5kNlWJl0IEgXy7Mb5NI87xwrv+6A94EW4v1vmQ0wcRql35HHny7mT2dYX2
	nSt9P09/VBiDBqX2sRFpV5msPapHx1c5D1yF/CYp0emxOzA5/AFcaT4UuGTZEWTlEDrn
	DiFJU3M9YzQAXtCK9x4bxtr+El4uKGLqGAbNmTIqRGo80v92uOMzqEMtvU+0+FSs40Xe
	/1tw==
X-Gm-Message-State: ALoCoQnUP68cMb+lw/M9YK0Md4Tlr7IonhxW13njTaDt0YXU41kHi8kDPs9gmpW00MOV0H+kirbu
X-Received: by 10.43.155.84 with SMTP id lh20mr1476738icc.81.1397062697525;
	Wed, 09 Apr 2014 09:58:17 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id u1sm6393502igm.8.2014.04.09.09.58.16
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Apr 2014 09:58:16 -0700 (PDT)
Message-ID: <53457C1D.3000200@linaro.org>
Date: Wed, 09 Apr 2014 12:58:05 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1397059003-9413-1-git-send-email-trevor.woerner@linaro.org>
	<CAJTo0LYsWzZ3-GDLCSVM7pQmVpvCA2T1PhsE92E=TAdJgTbqjg@mail.gmail.com>
In-Reply-To: <CAJTo0LYsWzZ3-GDLCSVM7pQmVpvCA2T1PhsE92E=TAdJgTbqjg@mail.gmail.com>
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
X-List-Received-Date: Wed, 09 Apr 2014 16:58:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/14 12:24, Burton, Ross wrote:
> Please don't say the next patch is adding Motif to oe-core! :) Ross 

haha! A little too late for April 1st, eh?

I'm still working through a world build of (mostly) meta-openembedded
and motif is there. Is there a better place to add common license files?

