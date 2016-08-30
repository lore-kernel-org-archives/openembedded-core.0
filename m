Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCBD65CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 22:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UMgjnI023394; Tue, 30 Aug 2016 23:44:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F_eeXMX8ZPYX; Tue, 30 Aug 2016 23:44:03 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UMhxE2023449
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 30 Aug 2016 23:44:00 +0100
Message-ID: <1472597039.29583.58.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 23:43:59 +0100
In-Reply-To: <f6ef8fb895e0b0b4263ae5ebba8756137b5756c0.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
	<f6ef8fb895e0b0b4263ae5ebba8756137b5756c0.1472480768.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 08/15] gnutls: update to 3.5.3
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
X-List-Received-Date: Tue, 30 Aug 2016 22:44:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-08-29 at 17:30 +0300, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-support/gnutls/{gnutls_3.5.1.bb => gnutls_3.5.3.bb} | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/gnutls/{gnutls_3.5.1.bb =>
> gnutls_3.5.3.bb} (60%)

http://errors.yoctoproject.org/Errors/Details/81202/

Cheers,

Richard


