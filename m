Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EBF36013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 13:50:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2HDorV2022047
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Mar 2015 06:50:53 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 17 Mar 2015 06:50:52 -0700
Message-ID: <55083111.9090301@windriver.com>
Date: Tue, 17 Mar 2015 09:50:09 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1426525757.git.bruce.ashfield@windriver.com>
	<1cd7d6881e747b3458140e34d7801141b0ae62d1.1426525757.git.bruce.ashfield@windriver.com>
	<CAJTo0LbvjhZ8nUzua80y+K23n7CS+sY7QcDYg3PqjJWLe+_fwQ@mail.gmail.com>
	<55081C38.9080901@windriver.com>
	<CAJTo0LbffFs6r_GkzF7CTUP+1yxrUydwq6RxRZTgJhbZbhiYSA@mail.gmail.com>
In-Reply-To: <CAJTo0LbffFs6r_GkzF7CTUP+1yxrUydwq6RxRZTgJhbZbhiYSA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] kernel-yocto: split meta data generation from patching phase
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
X-List-Received-Date: Tue, 17 Mar 2015 13:50:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-03-17 09:49 AM, Burton, Ross wrote:
>
> On 17 March 2015 at 14:21, Bruce Ashfield <bruce.ashfield@windriver.com
> <mailto:bruce.ashfield@windriver.com>> wrote:
>
>     It was. The extra output only goes to the logs, and it is helpful
>     in diagnosing problems.
>
>     .. and yes, the obvious follow up is that I should have put that
>     in the commit message!
>
>
> It looked a bit like debugging changes, thought I'd check.

Always better to be safe. It's not like we all haven't left those
in before :)

Bruce

>
> Cheers,
> Ross


