Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web10.41799.1589808005021876711
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 06:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 49Qfkp5YKsz5tlN;
	Mon, 18 May 2020 15:20:01 +0200 (CEST)
Date: Mon, 18 May 2020 15:20:00 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org, richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [PATCH v2] classes: base|insane: check pkgs lics are subset of recipe lics only once
Message-ID: <20200518132000.vpjvpfmi7rsqy7tg@qschulz>
References: <1607A04B2CF7553C.19761@lists.openembedded.org>
 <160BC76573421D52.16415@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <160BC76573421D52.16415@lists.openembedded.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

On Mon, May 04, 2020 at 10:55:26AM +0200, Quentin Schulz wrote:
> Hi all,
> 
> Gentle ping. Don't forget the doc patch (I messed up and send it in its
> own "patchseries").
> 

Let me know if there's anything stopping this patch being merged.

Thanks,
Quentin
