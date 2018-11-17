Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3FBDC6C18B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 22:59:18 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wAHMtHBY031434
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 17 Nov 2018 22:55:18 GMT
Message-ID: <dfb9fc9720b17daf664bff436f950d07c1daff57.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marek Vasut <marek.vasut@gmail.com>, auh@auh.yoctoproject.org,
	openembedded-core@lists.openembedded.org
Date: Sat, 17 Nov 2018 22:55:17 +0000
In-Reply-To: <be32ec5d-9c69-0625-10a2-a32b587bc02a@gmail.com>
References: <20181117144457.A7B74440002@auh.yoctoproject.org>
	<be32ec5d-9c69-0625-10a2-a32b587bc02a@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [AUH] Upgrade status: 2018-11-17
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
X-List-Received-Date: Sat, 17 Nov 2018 22:59:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-11-17 at 22:42 +0100, Marek Vasut wrote:
> On 11/17/2018 03:44 PM, auh@auh.yoctoproject.org wrote:
> > Recipe upgrade statistics:
> > 
> >     * Failed(other errors): 1
> >         u-boot, 2018.11, Marek Vasut <...>
> 
> Is there any chance AUH will be fixed to update U-Boot properly, that
> is, all recipes at once ? Now it updates it partly and fails,
> obviously.

It would be really nice to do that. The question is who, if anyone is
going to write patches to teach it to do that? Can you help?

Cheers,

Richard


