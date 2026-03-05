Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C322BF33A7F
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 15:03:04 +0000 (UTC)
Received: from dkim1.emailarray.com (dkim1.emailarray.com [65.39.216.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46234.1772722976999819221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 07:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@balister.org header.s=eeenuy header.b=d+VX645B;
 spf=pass (domain: balister.org, ip: 65.39.216.94, mailfrom: philip@balister.org)
Received: (qmail 4906 invoked from network); 5 Mar 2026 15:02:55 -0000
Received: from localhost (HELO dkim1.emailarray.com) (127.0.0.1)
  by dkim1.emailarray.com with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 5 Mar 2026 15:02:55 -0000
Received: (EmailArray Haraka outbound); Thu, 05 Mar 2026 10:02:55 -0500
Received: from smtp3.emailarray.com ([192.168.1.37])
	by dkim1.emailarray.com (Haraka/2.8.25) with ESMTPS id 0D11F728-C19A-4C4B-83A2-A86415631F56.1
	envelope-from <philip@balister.org>
	(cipher=ECDHE-RSA-AES256-GCM-SHA384);
	Thu, 05 Mar 2026 10:02:55 -0500
Received: (qmail 86047 invoked by uid 89); 5 Mar 2026 15:02:55 -0000
X-Orig-Sender: philip@balister.org
Received: from unknown (HELO ?10.20.46.253?) (cGhpbGlwQGJhbGlzdGVyLm9yZ0A1MC4xNTIuMTkuNTg=) (POLARISLOCAL)  
  by smtp3.emailarray.com with SMTP; 5 Mar 2026 15:02:55 -0000
Message-ID: <d37e2dad-42a4-455f-8cc1-cb476ec07e7f@balister.org>
Date: Thu, 5 Mar 2026 08:02:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
 openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>,
 openembedded-core <openembedded-core@lists.openembedded.org>,
 "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>
From: Philip Balister <philip@balister.org>
Subject: Developer meetup the afternoon before Embedded Recipes
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1;a=rsa-sha256;bh=3vrk7v/tWAZAWs39JHWyOApl65jQAjlGrbhp+MwtrFI=;c=relaxed/simple;d=balister.org;h=from:subject:date:message-id:to:mime-version;s=eeenuy;b=d+VX645B32JwJrrtL7CK89mJsJFT9i0VM3zK3zyYXxtcsnBH59tVtfdKnXE2XoP3istpAx49Bzxewmeij2lHTzqYipvx9p0Q/2nvlC/o0P9VsskNi84CeTHI4wsdHH1u2+M9/46eND8UmTAnknH4nL4M0r+23ff75GstL2uBbbU=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 15:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232496

I am gauging interest for a developer meetup on the afternoon before 
embedded recipes in Nice at the end of May. Please let us know if you 
are interested by signing up here: 
https://pretix.eu/OpenEmbedded/ER26meetup/

Follow up info will be here:

https://discussion.openembedded.org/t/developer-meetup-before-embedded-recipes/97

and sent to people registered on pretix.

Philip

