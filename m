Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.4363.1628254908487006370
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 06:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 9B8E1E0005;
	Fri,  6 Aug 2021 13:01:46 +0000 (UTC)
Subject: Re: [OE-core] [PATCH v4 7/7] MAINTAINERS: add overlayfs maintainer
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 Openembedded-core@lists.openembedded.org
References: <20210806120611.124246-1-uvv.mail@gmail.com>
 <20210806120611.124246-7-uvv.mail@gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <94ee702a-a850-795c-4ebb-1e396c77864d@bootlin.com>
Date: Fri, 6 Aug 2021 15:01:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806120611.124246-7-uvv.mail@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/6/21 2:06 PM, Vyacheslav Yurkov wrote:
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  MAINTAINERS.md | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS.md b/MAINTAINERS.md
> index 2ddcde6878..36a9bde90c 100644
> --- a/MAINTAINERS.md
> +++ b/MAINTAINERS.md
> @@ -40,6 +40,7 @@ Component/Subsystem Maintainers
>  * opkg: Alex Stewart
>  * devtool: Saul Wold
>  * eSDK: Saul Wold
> +* overlayfs: Vyacheslav Yurkov


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

;-)

Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

