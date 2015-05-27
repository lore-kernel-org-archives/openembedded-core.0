Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 95F8965D6E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 07:52:57 +0000 (UTC)
Received: by oihb142 with SMTP id b142so1421066oih.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 00:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JCJmQAN7xrXcrNXvAw5NEbfdYEbNmx0O6UOvnhrP5Zw=;
	b=Es0PwQNT2VWRbPvhm01y53NWJoy/8nAgVuqbV3/UDhcEybO+LmLIiWOK+8xFcs+D9z
	yynDityizTZ1vHzOeTEYcFcg2AhnuuZILj9eZTaNWTMxdOclZ35EhDEv8C3MYbRMj8Me
	5v+tO2jQIf4IeLkNx+6Q7xk+ggtLPtQ6e1vMkVN6tiZh7FWC6mtZJD25QSClvEmC8IK2
	oMOAR3FTCViqqBlZcpxO44YeAxiwHpE5pOifTE00rVrtaJXyFPkpftBN5feX5b7UnLSD
	eUg3nBKb7szG4mvgQHdDAlgnvZLNDbrh/oAaHa+zxkupWnkWu3CHrAn+8gc29w691yab
	4wkg==
X-Gm-Message-State: ALoCoQk29cwE8PXA/dEbndEQITCC0KI+/cq0Fg37YZtTKMgXRkLe46f6cO4hQKopjeJYMz9w3e+V
X-Received: by 10.202.57.137 with SMTP id g131mr23457346oia.122.1432713178319; 
	Wed, 27 May 2015 00:52:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Wed, 27 May 2015 00:52:27 -0700 (PDT)
In-Reply-To: <1432712464-12695-1-git-send-email-hroussille@adeneo-embedded.com>
References: <1432712464-12695-1-git-send-email-hroussille@adeneo-embedded.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 27 May 2015 10:52:27 +0300
Message-ID: <CAHiDW_F9EUJ9bLyp8L3xS9fDhWwsw+XD_8juRwP2DJvdODdaRg@mail.gmail.com>
To: Hector Roussille <hroussille@adeneo-embedded.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Adding support for directFB to mplayer2 recipe
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
X-List-Received-Date: Wed, 27 May 2015 07:52:58 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 27 May 2015 at 10:41, Hector Roussille
<hroussille@adeneo-embedded.com> wrote:
> ---
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 3 ++-

Please send patches against meta-oe to openembedded-devel list.

Jussi

