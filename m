Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web12.60022.1606744296222878831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 05:51:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4Cl68j0WdCz5tlH;
	Mon, 30 Nov 2020 14:51:32 +0100 (CET)
Date: Mon, 30 Nov 2020 14:51:31 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lz4: Use the new branch naming from upstream
Message-ID: <20201130135131.5vxtbajvhepxc474@qschulz>
References: <20201130134703.3279682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20201130134703.3279682-1-richard.purdie@linuxfoundation.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

On Mon, Nov 30, 2020 at 01:47:03PM +0000, Richard Purdie wrote:
> Upstream renamed master -> dev, update SRC_URI to match.
> 

Wondering if "release" branch does not make more sense?

Quentin
