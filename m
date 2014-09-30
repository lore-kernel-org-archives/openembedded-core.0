Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B76B460809
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 17:55:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8UHtRLa028547
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 10:55:28 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 30 Sep 2014 10:55:27 -0700
Message-ID: <542AEE8E.6070601@windriver.com>
Date: Tue, 30 Sep 2014 12:55:26 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <542AE4DF.7060203@gmail.com>
In-Reply-To: <542AE4DF.7060203@gmail.com>
Subject: Re: qemuppc64
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
X-List-Received-Date: Tue, 30 Sep 2014 17:55:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/14, 12:14 PM, akuster808 wrote:
> Hello,
>
> With 1.7 in the midst of being finalized, when would be a good time for
> me to continue perusing getting qemuppc64 accepted to master-next?
>
> regards,
> Armin
>

I'd suggest do like the aarch64 stuff.. put the qemuppc64 into a custom branch 
(along with any other changes you might need).. keep it rebased.. and lets try 
to get it in once this iteration is complete.. (hopefully right away in the next).

--Mark

