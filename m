Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 602846013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 13:51:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2HDpQa0022169
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Mar 2015 06:51:26 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 17 Mar 2015 06:51:25 -0700
Message-ID: <55083132.4090702@windriver.com>
Date: Tue, 17 Mar 2015 09:50:42 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1426525757.git.bruce.ashfield@windriver.com>
	<82c728adf7229f85982233033cf23c1c6041069c.1426525757.git.bruce.ashfield@windriver.com>
	<CAJTo0LYgteZ1kuHLj4WJr6D12_9JRD2+McYtO7TVrCAOoUDtKg@mail.gmail.com>
	<55081BFD.40607@windriver.com>
	<CAJTo0LYcmMzAd-q84HhmCO38XJjWmdnGPQAe+X-EqieBoUER-Q@mail.gmail.com>
In-Reply-To: <CAJTo0LYcmMzAd-q84HhmCO38XJjWmdnGPQAe+X-EqieBoUER-Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] perf: drop PR
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
X-List-Received-Date: Tue, 17 Mar 2015 13:51:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-03-17 09:48 AM, Burton, Ross wrote:
>
> On 17 March 2015 at 14:20, Bruce Ashfield <bruce.ashfield@windriver.com
> <mailto:bruce.ashfield@windriver.com>> wrote:
>
>     But doesn't that mean that my bash RDEPENDS fix needs a PR
>     bump ?
>
>
> No, you don't need to bump as the PR service will bump when it rebuilds.

Great. So you'll just drop my PR patch, and the keep the other.
Just making sure that I don't need a resend, since I'm heading
for a flight and won't be around for the next 6 or 7 hours :)

Bruce

>
> Ross


