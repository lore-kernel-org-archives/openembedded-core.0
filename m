Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2C244731AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 06:35:16 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id p187so50204801wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 22:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=XhF00/TiMgQj5WY2gmgL5DPOfcbriBkLRq8HiIZJVvI=;
	b=Rdp/6k80DKAJCAOvtgNYPd4dtrH+GFpX2J12caVOj8noI+8/NM2AeA/vcMuFXL+/Sq
	C+2PM6v2vR8I5vJEEIcX+JVVacjZ2x4l8jdIcw6Y3478V1aQalEJALOcqO2BGt+8JKDW
	r3PNRX6rNGG0n952+CTNqfB4AIOwVkTNRbmzD5T5NUAaV+4tacqYCpsXs+2Wro29GvKw
	3L2dmPMfivmaXHOk/uQteKClmvVTrjzYf0pZEpT3SQh9zuZQJlKlaVHmrBeohzDzMRn+
	MjEPev2m9e9YXerP2L4WubWa8VrVJw5CKONSXF+R2qs5U78xLebuXlPsVPX0uhIkL7dR
	O45Q==
MIME-Version: 1.0
X-Received: by 10.28.86.196 with SMTP id k187mr902341wmb.61.1450420516682;
	Thu, 17 Dec 2015 22:35:16 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Thu, 17 Dec 2015 22:35:16 -0800 (PST)
Date: Thu, 17 Dec 2015 22:35:16 -0800
Message-ID: <CAJ86T=VZ41Ck-wOPwqD+VhrUWc7h1z0G09CopCfkR3Pof1kUmQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: gstreamer 1.6.2
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
X-List-Received-Date: Fri, 18 Dec 2015 06:35:21 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

Is anyone already working on updating gstreamer 1.6.1 -> 1.6.2 ?

http://gstreamer.freedesktop.org/releases/1.6/

