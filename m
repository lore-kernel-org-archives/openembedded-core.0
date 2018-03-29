Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D7B9978289
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 13:13:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2TDDnei029943
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 29 Mar 2018 14:13:51 +0100
Message-ID: <1522329229.11431.90.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Thu, 29 Mar 2018 14:13:49 +0100
In-Reply-To: <fb094e1e-1196-0bed-190f-e69bf51bb675@windriver.com>
References: <cover.1522162765.git.bruce.ashfield@windriver.com>
	<CAJTo0Lbv_7wXs1mgoqtBc6zWN_bazjwYpc1FbLzT3-zqUnNUHg@mail.gmail.com>
	<CAJTo0La+oWebhkQXgFvY2yMQdwZzQ=ENbnyx0=5=MuvDiEBqew@mail.gmail.com>
	<fb094e1e-1196-0bed-190f-e69bf51bb675@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 29 Mar 2018 13:13:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-03-29 at 08:58 -0400, Bruce Ashfield wrote:
> There's the stack validation warning, but I can run the hellomod
> test on my qemux86-64 target and the 4.14 kernel.
> 
> It is an incremental patch to linux-yocto_4.14 to add the
> dependencies.
> 
> Would you like the entire queue again, or just the new patch sent to
> the list ?

Just new patches is fine, I have the current set in master-next,
thanks.

Richard

