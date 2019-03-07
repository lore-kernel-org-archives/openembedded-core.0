Return-Path: <jan.kiszka@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id A4EE07CE7D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 09:37:32 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x279bR7K026350
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 7 Mar 2019 10:37:27 +0100
Received: from [139.22.38.51] ([139.22.38.51])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x279bRbL022062;
	Thu, 7 Mar 2019 10:37:27 +0100
To: michael.davis@essvote.com
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <46d4a7de-f19f-8fa2-63b7-f21431d3435c@siemens.com>
Date: Thu, 7 Mar 2019 10:37:26 +0100
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: npm offline build for yocto
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
X-List-Received-Date: Thu, 07 Mar 2019 09:37:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Michael,

I found your progress report (and unanswered question) on that topic in 
http://lists.openembedded.org/pipermail/openembedded-core/2018-April/268639.html. 
Did this effort go further?

I just ran into it again while updating https://github.com/siemens/meta-iot2000 
to Node.js >v6. I also played with prefilling the cache, but likely in the wrong 
way.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

