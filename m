Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 98E5378854
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 02:44:38 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2F2iXJO029517
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Mar 2018 02:44:36 GMT
Message-ID: <1521081872.25754.60.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2018 19:44:32 -0700
In-Reply-To: <CA+chaQfQ8y60w15ot+Gn0Hnvv5P-gU_07fpW-HYRy-VNY18M+Q@mail.gmail.com>
References: <cover.1520728804.git.Martin.Jansa@gmail.com>
	<46eeffd1f3886c633a7586562b1ec67508650528.1520728804.git.Martin.Jansa@gmail.com>
	<CA+chaQfQ8y60w15ot+Gn0Hnvv5P-gU_07fpW-HYRy-VNY18M+Q@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [rocko][PATCH 1/8] Revert "waf.bbclass: explicitly pass bindir and libdir if supported"
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
X-List-Received-Date: Thu, 15 Mar 2018 02:44:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-03-14 at 16:28 +0100, Martin Jansa wrote:
> ping, this was in rocko-next for a while and then it disappeared.

I think it was conflicting with some work Armin was doing so please
sync with him and how he plans to sort things.

Cheers,

Richard

