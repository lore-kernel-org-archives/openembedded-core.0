Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id B2C726B090
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 15:41:14 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id d10so4722998vea.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2013 08:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=mRFdMlwR7RsVHaQWRZYNdX8lo5JfevL9plkQs1JQ5i8=;
	b=E3IbxS6slpSjSkTjmZ1/Yk9a9ej1HQAFSxlcM498wxfNg81X4XDSgfaKTSmm7FsS6y
	5pN7uugENz7mYIoHvK67tQIIvYovfN4KLjls55Yze7bR0zAaWTRb8qWTPGl1Fz6FELyj
	O9jbLU1MDS15Ev1tLJLsj4qgmgJ3hechy73jl6Bbl0aSRfyebKxCT4Wg8Jt44yLlrqmP
	HLah56VGgAGmJMJmAE/Hb43Y4IzIt4Abl1vEzWTfXAguxYVKUiNyGXgKcimM7ctUKEPU
	JDv7AU4hpe4uXHbqFhU6vWEVOSONrioqHuf/PrQhEw8Tj9+32e/0tFBNniiHFTZhH1jp
	8TMA==
X-Received: by 10.220.73.66 with SMTP id p2mr16752654vcj.94.1373384475664;
	Tue, 09 Jul 2013 08:41:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 9 Jul 2013 08:40:55 -0700 (PDT)
In-Reply-To: <cover.1373384160.git.sgw@linux.intel.com>
References: <cover.1373384160.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jul 2013 16:40:55 +0100
Message-ID: <CAJTo0Lb4yXzqhcPExKo7fyR1NJ56aAKfMHi_M+NcrMsWBGY5RA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmJyo4KQecBz92P7PDUQVogB+ZUV6PLcJEwamFKpi9uSoLc6eYGri14oge3kn1wc+0EQfaT
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/59] Ready for Pull
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
X-List-Received-Date: Tue, 09 Jul 2013 15:41:15 -0000
Content-Type: text/plain; charset=UTF-8

On 9 July 2013 16:38, Saul Wold <sgw@linux.intel.com> wrote:
> This is the updated version with some additional patches dropped
> Please ACK for RP

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross

