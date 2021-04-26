Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web08.5139.1619434020774742362
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 03:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4FTM5t2x4Yz5tlH;
	Mon, 26 Apr 2021 12:46:58 +0200 (CEST)
Date: Mon, 26 Apr 2021 12:46:57 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual/common-tasks.rst: correct the documentation for debuginfod
Message-ID: <20210426104657.yeyfms3riieplyia@qschulz>
References: <20210426104210.789444-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210426104210.789444-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

Could you please add the v2/v3/vwhatever in the mail subject next time?
You can do so by passing `-v 2` to `git format-patch`. This helps us
keep track of which version of a patch should be merged (well, it helps
Michael :p) and on which patch series to answer/rewview.

No need to do it this time :)

Thanks for the patch, LGTM!
Quentin
