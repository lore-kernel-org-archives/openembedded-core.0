Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C30E178955
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 13:29:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w24DSxxQ015181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 4 Mar 2018 13:29:00 GMT
Message-ID: <1520170139.3436.68.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 04 Mar 2018 13:28:59 +0000
In-Reply-To: <CA+chaQeV1f7yUt3w5t7iXrYf5OyMjbxr-C_dqKGqG+jDt4gFcA@mail.gmail.com>
References: <1520162580-30003-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CA+chaQeV1f7yUt3w5t7iXrYf5OyMjbxr-C_dqKGqG+jDt4gFcA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][pyro] gcc6: Upgrade to 6.4.0 (latest stable series release)
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
X-List-Received-Date: Sun, 04 Mar 2018 13:29:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2018-03-04 at 12:38 +0100, Martin Jansa wrote:
> Is this backport of https://patches.openembedded.org/patch/144961/ ?
> 
> If yes, why does it have different author?

I suspect this was done independently and it wasn't realised that there
was a patch that could be backported. We'll wait for Juro to comment.

I posted it as I really wanted to get it reviewed, it passed the test
builds and I'm keen to get some of these issues resolved before travel
starts complicating things for me.

Cheers,

Richard

