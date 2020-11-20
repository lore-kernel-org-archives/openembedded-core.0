Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.634.1605893324188916999
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:28:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vincent.stehle@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAD9B1042;
	Fri, 20 Nov 2020 09:28:43 -0800 (PST)
Received: from debian (unknown [10.57.61.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 322543F70D;
	Fri, 20 Nov 2020 09:28:43 -0800 (PST)
Date: Fri, 20 Nov 2020 18:28:38 +0100
From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH pseudo] Fix build with gcc 10
Message-ID: <20201120172838.GA31184@debian>
References: <20201120163853.13737-1-vincent.stehle@arm.com>
 <d042ad2eb586ce7e546386462c3a63d6b62463c7.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <d042ad2eb586ce7e546386462c3a63d6b62463c7.camel@linuxfoundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 20, 2020 at 05:24:31PM +0000, Richard Purdie wrote:
> I think we already have this in the pseudo branch we use for OE?

Hi Richard,

This is correct. I was looking at the master branch. Sorry for the noise.

Best regards,
Vincent.
